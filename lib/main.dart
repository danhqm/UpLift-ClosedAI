import 'package:flutter/material.dart';
import 'package:uplift/page/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // <-- Add this line
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}
