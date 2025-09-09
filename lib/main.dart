import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uplift/dbConnection.dart';
import 'package:uplift/page/splashscreen.dart';
import 'package:uplift/page/signinscreen.dart';
import 'package:uplift/page/bottomnav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");   // Load environment variables
  await DatabaseConnection().getConnection();  // Initialize DB connection once
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // Lifecycle changes
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.detached) {
      // App is being killed = close DB connection
      await DatabaseConnection().closeConnection();
    }
    // Note: do NOT close connection on pause/inactive/background
  }

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
