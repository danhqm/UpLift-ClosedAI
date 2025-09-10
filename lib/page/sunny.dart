import 'package:flutter/material.dart';
import 'package:uplift/page/sunnychatbot.dart';

class Sunny extends StatelessWidget {
  const Sunny({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Title
              const Text(
                'Talk to Sunny',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 10),
              // Description
              const Text(
                'Need someone to express your feelings?\nTry our voice conversation or chatbot!',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4F3422),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // GIF & other content...
// Sunny GIF with centered text below
              Center(
                child: Column(
                  children: [
                    // GIF
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
                    const SizedBox(height: 12), // spacing between GIF and text
                    const Text(
                      'Feeling up or down? I\'m here to chat and brighten your day.',
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
              // Option cards
              Row(
                children: [
                  // Conversational AI Card
                  Expanded(
                    child: SizedBox(
                      height: 140, // fixed uniform height
                      child: _buildOptionCard(
                        title: 'Conversational\nAI',
                        onTap: () {
                          // Handle tap
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Chatbot AI Card
                  Expanded(
                    child: SizedBox(
                      height: 140, // fixed uniform height
                      child: _buildOptionCard(
                        title: 'Chatbot\nAI',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SunnyChatbot()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20), // Extra padding at bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard({required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFDF6D14),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Title near top-center
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),

            // Arrow at bottom-right
            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }


}