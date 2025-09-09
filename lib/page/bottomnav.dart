import 'package:flutter/material.dart';
import 'package:uplift/page/acadplan.dart';
import 'package:uplift/page/homescreen.dart';
import 'package:uplift/page/mood.dart';
import 'package:uplift/page/profile.dart';
import 'package:uplift/page/sunny.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentPage = 0;

  final List<Widget> pages = const [
    Home(),
    Acadplan(),
    Sunny(),
    Mood(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9BB068),
        child: const Icon(Icons.android_outlined, color: Color(0xFF736B66)),
        onPressed: () {
          setState(() {
            currentPage = 2; // middle page (Sunny)
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home,
                  color: currentPage == 0
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => setState(() => currentPage = 0),
            ),
            IconButton(
              icon: Icon(Icons.article_outlined,
                  color: currentPage == 1
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => setState(() => currentPage = 1),
            ),
            const SizedBox(width: 48), // space for floating button
            IconButton(
              icon: Icon(Icons.mood_outlined,
                  color: currentPage == 3
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => setState(() => currentPage = 3),
            ),
            IconButton(
              icon: Icon(Icons.person_outline,
                  color: currentPage == 4
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => setState(() => currentPage = 4),
            ),
          ],
        ),
      ),
    );
  }
}
