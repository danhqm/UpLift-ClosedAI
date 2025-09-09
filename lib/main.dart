import 'package:flutter/material.dart';
import 'package:uplift/page/splashscreen.dart';
import 'package:uplift/page/signinscreen.dart';
import 'package:uplift/page/bottomnav.dart';

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
      initialRoute: '/bottomnav',
      routes: {
        '/splash': (context) => const Splash(),
        '/signin': (context) => const Signin(),
        '/bottomnav': (context) => const Bottomnav(),
      },
    );
  }
}