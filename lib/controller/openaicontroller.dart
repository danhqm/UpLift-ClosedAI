import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String openaiApiKey = dotenv.env['OPENAI_KEY'] ?? '';

  OpenAIService() {
    if (openaiApiKey.isEmpty) {
      throw Exception("OpenAI API key is missing. Please check your .env file.");
    }
  }

  // Main conversation logic
  Future<String> runConversation(String content) async {
    // Define the tools
    final List<Map<String, dynamic>> tools = [
      {
        "type": "function",
        "name": "handle_general_app_info_question",
        "description": "Handles general inquiries about the UpLift app, including greetings, acknowledgments (e.g., 'Hello', 'Thank you'), and questions regarding the app's purpose, features, and functionality. This includes explanations of core features.",
        "strict": true,
        "parameters": {
          "type": "object",
          "properties": {
            "content": {
              "type": "string",
              "description": "The user's general inquiry about UpLift application or interaction."
            }
          },
          "required": ["content"],
          "additionalProperties": false
        }
      },
    ];

    // System prompt to guide function usage
    const String systemPrompt = """
    You are a chatbot for the UpLift mobile app, designed to assist users with health management, symptom tracking, medication reminders, and general app-related inquiries.
    
    Follow these rules:
    1. Use the 'handle_general_app_info_question' function for general app-related queries, greetings, and casual interactions. This includes questions about the app's purpose, features, and functionality.
    2. Only call a function if the user's request is relevant to it. If no function is applicable, respond conversationally without invoking a function.
    """;

    // Prepare the request payload for OpenAI API
    final Map<String, dynamic> payload = {
      "model": "gpt-4.1-mini-2025-04-14",
      "input": [
        {"role": "system", "content": systemPrompt},
        {"role": "user", "content": content}
      ],
      "tools": tools,
      "tool_choice": "auto"
    };

    try {
      // Send the API request
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/responses'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $openaiApiKey',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        // print('Raw API response: ${response.body}');
        final responseData = jsonDecode(response.body);
        // print (responseData);
        final responseMessage = responseData['output'][0];

        // Check if a function was called
        if (responseMessage['type'] == 'function_call' && responseMessage['status'] == 'completed') {
          final String functionName = responseMessage['name'];
          final Map<String, dynamic> functionArguments = jsonDecode(responseMessage['arguments']);

          // Debugging: Print function name and arguments
          print('Function called: $functionName');
          print('Function arguments: ${jsonEncode(functionArguments, toEncodable: (e) => e.toString())}');

          // Map functions to their implementations
          final Map<String, Function> availableFunctions = {
            "handle_general_app_info_question": handleGeneralAppInfoQuestion,
          };

          // Call the selected function if available
          if (availableFunctions.containsKey(functionName)) {
            return availableFunctions[functionName]!(functionArguments['content']);
          }
        }
        // Default response if no function call
        return "I'm sorry, I can only assist with questions related to the app's features and functionalities only.";

      } else {
        // Handle HTTP errors
        return "Error: ${response.statusCode} - ${response.reasonPhrase}";
      }
    } catch (e) {
      // Handle network or other errors
      return "An error occurred: $e";
    }
  }

  // Function to handle general app info questions
  Future<String> handleGeneralAppInfoQuestion(String content) async {
    final List<Map<String, dynamic>> tools = [{
      "type": "file_search",
      "vector_store_ids": ["vs_68c1bf32ffa08191b1e782425028507f"],
    }];

    String prompt = """
    You are a knowledgeable and concise assistant dedicated to answering questions about the UpLift app. 
    
    - If the user's question is about the app's features, purpose, or functionality, provide a clear, concise, and accurate response.  
    - If the question is unrelated to the app, politely redirect the user to focus on UpLift-related inquiries.  
    - If the user is engaging in casual interaction rather than asking a question, respond in a friendly and conversational manner to maintain a natural user experience.  
    
    Note for you: 
    - Provide answers in a concise and clear format. 
    - Do not use emojis, font styles (e.g., bold, italics), or other visual embellishments.
    - Avoid over-explaining user questions; keep responses focused and to the point.

    User's question: "$content"
    """;


    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/responses'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $openaiApiKey',
      },
      body: json.encode({
        "model": "gpt-4.1-mini-2025-04-14",
        "input": [{"role": "system", "content": prompt}],
        "tools": tools,
        "tool_choice": "required"
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      // Find the first output with a 'content' list containing type = output_text
      final output = responseBody['output']?.firstWhere(
            (item) => item['type'] == 'message' && item['content'] != null,
        orElse: () => null,
      );

      if (output != null) {
        final contentList = output['content'];
        final textItem = contentList.firstWhere(
              (item) => item['type'] == 'output_text',
          orElse: () => null,
        );
        if (textItem != null) {
          return textItem['text'];
        }
      }

      return 'No valid text response found.';
    } else {
      return 'Error in fetching response from OpenAI.';
    }
  }

}
