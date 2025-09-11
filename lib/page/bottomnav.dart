import 'package:flutter/material.dart';
import 'package:uplift/page/acadplan.dart';
import 'package:uplift/page/homescreen.dart';
import 'package:uplift/page/mood.dart';
import 'package:uplift/page/profile.dart';
import 'package:uplift/page/sunny.dart';
import 'package:uplift/page/acadprogress.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentPage = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    // Initialize pages and pass a callback to switch tabs
    pages = [
      Home(onTabChange: _changePage),
      Acadplan(onTabChange: _changePage),
      Sunny(onTabChange: _changePage),
      Mood(onTabChange: _changePage),
      Profile(onTabChange: _changePage),
      Acadprogress(onTabChange: _changePage),
    ];
  }

  void _changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF9BB068),
        onPressed: () => _changePage(2), // Sunny page
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'media/sunny.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
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
              onPressed: () => _changePage(0),
            ),
            IconButton(
              icon: Icon(Icons.article_outlined,
                  color: currentPage == 1
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => _changePage(1),
            ),
            const SizedBox(width: 48), // space for FAB
            IconButton(
              icon: Icon(Icons.mood_outlined,
                  color: currentPage == 3
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => _changePage(3),
            ),
            IconButton(
              icon: Icon(Icons.person_outline,
                  color: currentPage == 4
                      ? const Color(0xFFDF6D14)
                      : const Color(0xFF736B66)),
              onPressed: () => _changePage(4),
            ),
          ],
        ),
      ),
    );
  }
}
