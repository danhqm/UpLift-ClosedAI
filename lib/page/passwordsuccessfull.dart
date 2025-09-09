import 'package:flutter/material.dart';
import 'package:uplift/page/homescreen.dart';


class Passwordsuccessfull extends StatelessWidget {
  const Passwordsuccessfull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Image(
              image: AssetImage('media/Checkround.png'),
              width: 178,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 43),
            SizedBox(
              width: 280, // set max width
              child: const Text(
                'Recovery Password Completed',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4F3422),
                ),
                textAlign: TextAlign.center,
                softWrap: true, // ensures wrapping
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 344,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F3422),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Handle button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}