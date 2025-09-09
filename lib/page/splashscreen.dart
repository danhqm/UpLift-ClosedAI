import 'package:flutter/material.dart';
import 'dart:async';
import 'package:uplift/page/loadingscreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToLoading();
  }

  _navigateToLoading() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Loading()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F4F2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // keeps content centered
          children: [
            Image(
              image: AssetImage('media/Logo.png'),
              width: 350,
              height: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 10), // space between logo and text
            Text(
              "Rise above, stay balanced",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.brown,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}

