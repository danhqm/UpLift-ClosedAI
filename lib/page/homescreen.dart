import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key, required void Function(int index) onTabChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Home")
          ],
        ),
      ),
    );
  }
}