import 'package:flutter/material.dart';
import 'package:uplift/page/sunnyconverse2.dart';

class SunnyConverseStart extends StatelessWidget {
  const SunnyConverseStart({super.key});

  @override
  Widget build(BuildContext context) {
    const subtitleText = "Feeling up or down? I'm here to chat and brighten your day.";

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF4F3422)),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              const Text(
                'Converse with Sunny',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Prefer speaking out loud? Try a voice \nconversation with Sunny.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4F3422),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 500,
                      height: 300,
                      child: Image.asset(
                        'media/sunny.gif',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              color: const Color(0xFFDF6D14).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(125),
                            ),
                            child: const Icon(
                              Icons.emoji_emotions_outlined,
                              size: 80,
                              color: Color(0xFFDF6D14),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      subtitleText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4F3422),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDF6D14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SunnyConverseActive(),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Conversation",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
