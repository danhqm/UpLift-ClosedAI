import 'package:flutter/material.dart';
import 'package:uplift/page/onboardingscreen1.dart';
import 'package:uplift/page/signinscreen.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage('media/Logo.png'),
                width: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              const Text(
                  'Welcome to UpLift!',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4F3422),
                  ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 320, // set max width
                child: const Text(
                  'Your smart mental health companion, built specially for students like you.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF736B66),
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true, // ensures wrapping
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Onboarding1()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDF6D14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  minimumSize: const Size(327, 56),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF736B66),
                  ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Signin()),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFDF6D14),
                                width: 1.2,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDF6D14),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )

            ]
          ),
      ),
    );
  }
}
