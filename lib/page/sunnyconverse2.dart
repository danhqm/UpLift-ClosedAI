import 'package:flutter/material.dart';
import 'package:uplift/page/sunnyconverse3.dart';

class SunnyConverseActive extends StatefulWidget {
  const SunnyConverseActive({super.key});

  @override
  _SunnyConverseActiveState createState() => _SunnyConverseActiveState();
}

class _SunnyConverseActiveState extends State<SunnyConverseActive> {
  String subtitleText = "Feeling up or down? I'm here to chat and brighten your day.";
  bool isPaused = false; // toggle Pause / Continue

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
                    Text(
                      subtitleText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDF6D14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isPaused = !isPaused;
                            // Pause/Continue logic here
                          });
                        },
                        child: Text(
                          isPaused ? "Continue" : "Pause",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4F3422),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true, // can tap outside to dismiss
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: const Color(0xFFF7F4F2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(height: 40),
                                          const Text(
                                            "Sure you wanna quit?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF4F3422),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          const Text(
                                            "Talking with Sunny can help you feel your emotions and straighten your thoughts.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                              color: Color(0xFF4F3422),
                                              height: 1.4,
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 50,
                                            child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(0xFF4F3422), // brown color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(16),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context); // Close the popup
                                                // Navigate to SunnySummary page
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => const SunnySummary(
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(Icons.exit_to_app, color: Colors.white),
                                              label: const Text(
                                                "Exit",
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: IconButton(
                                        icon: const Icon(Icons.close, color: Color(0xFF4F3422), size: 28),
                                        onPressed: () => Navigator.pop(context), // just close popup
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Exit",
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
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
