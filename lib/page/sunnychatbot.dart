import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uplift/controller/openaicontroller.dart';

class SunnyChatbot extends StatefulWidget {
  const SunnyChatbot({super.key});

  @override
  _SunnyChatbotState createState() => _SunnyChatbotState();
}

class _SunnyChatbotState extends State<SunnyChatbot> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  final OpenAIService openAIService = OpenAIService();

  @override
  void initState() {
    super.initState();
    _addInitialGreeting();
  }

  void _addInitialGreeting() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _messages.add({'role': 'system', 'content': 'Hello! How can I assist you today?'});
      isLoading = false;
    });

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  void _sendMessage() async {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({'role': 'user', 'content': message});
        isLoading = true;
      });

      _controller.clear();

      try {
        String response = await openAIService.runConversation(message);
        setState(() {
          _messages.add({'role': 'system', 'content': response});
          isLoading = false;
        });

        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } catch (e) {
        setState(() {
          _messages.add({'role': 'system', 'content': 'Error: Unable to get response from the AI.'});
          isLoading = false;
        });
        print("Error: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable area: header + messages
            Padding(
              padding: const EdgeInsets.only(bottom: 80), // space for input bar
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF4F3422)),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'Chat with Sunny',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF4F3422),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xFFF7F4F2),
                          backgroundImage: AssetImage("media/sunny.png"),
                          radius: 30,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Sunny",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                color: Color(0xFF4F3422),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "with you through every high and low.",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: Color(0xFF4F3422),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Chat messages
                    ..._messages.map((message) {
                      final isUser = message['role'] == 'user';
                      return ListTile(
                        leading: isUser
                            ? null
                            : const CircleAvatar(
                          backgroundColor: Color(0xFFF7F4F2),
                          backgroundImage: AssetImage('media/sunny.png'),
                        ),
                        title: Align(
                          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: isUser ? const Color(0xFF4F3422) : const Color(0xFFDF6D14),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              message['content']!,
                              style: const TextStyle(color: Colors.white, fontFamily: 'Inter'),
                            ),
                          ),
                        ),
                      );
                    }).toList(),

                    if (isLoading) const ListTile(title: TypingIndicator()),

                    const SizedBox(height: 20), // space below messages
                  ],
                ),
              ),
            ),

            // Fixed input bar
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message...",
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.black),
                        onPressed: _sendMessage,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> {
  int _dotCount = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount % 3) + 1;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Color(0xFFF7F4F2),
          backgroundImage: AssetImage('media/sunny.png'),
        ),
        const SizedBox(width: 10),
        Text('.' * _dotCount, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
