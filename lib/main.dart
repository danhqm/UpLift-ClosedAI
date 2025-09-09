import 'package:flutter/material.dart';
import 'package:uplift/page/splashscreen.dart';
import 'package:uplift/page/signinscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/signin': (context) => const Signin(),
      },
    );
  }
}