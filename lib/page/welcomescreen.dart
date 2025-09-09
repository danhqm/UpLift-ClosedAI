import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F4F2),
      body: Center(
          child: Text(
              'Welcome to Uplift',
              style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.brown,
            ),
            textAlign: TextAlign.center,
          ),
      ),
    );
  }
}
