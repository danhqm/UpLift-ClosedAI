import 'package:flutter/material.dart';


class Sunny extends StatelessWidget {
  const Sunny({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("AI")
          ],
        ),
      ),
    );
  }
}