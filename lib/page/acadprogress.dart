import 'package:flutter/material.dart';

class Acadprogress extends StatelessWidget {
  final Function(int) onTabChange;
  const Acadprogress({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F4F2),
        body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, top: 20, bottom: 8),
                      child: Text(
                        "Academic Planning",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF4F3422),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 75, bottom: 20),
                      child: Text(
                        "Manage your deadlines and reduce academic stress with our.",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF4F3422),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
                      child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                onTabChange(1);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFDF6D14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                minimumSize: const Size(163, 45),
                              ),
                              child: const Text(
                                'Deadlines',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 6),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9BB068),
                                side: const BorderSide(color: Color(0xFF000000), width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                minimumSize: const Size(163, 45),
                              ),
                              child: const Text(
                                'Your Progress',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Your Progress",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4F3422),
                        ),
                      ),
                    ),
                  ]
              )
          ),
        )
    );
  }
}