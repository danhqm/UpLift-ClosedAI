import 'dart:async';
import 'package:flutter/material.dart';

class SunnySummary extends StatefulWidget {
  final String userMentioned;
  final String copingText;
  final String thereforeText;

  const SunnySummary({
    super.key,
    this.userMentioned = "I felt stressed due to assignments and exams.",
    this.copingText = "You practiced deep breathing and time management.",
    this.thereforeText = "Therefore, you are learning to handle stress more effectively.",
  });

  @override
  _SunnySummaryState createState() => _SunnySummaryState();
}

class _SunnySummaryState extends State<SunnySummary> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate 5-second loading
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: isLoading
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  color: const Color(0xFFDF6D14),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Generating the conversation summary...",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4F3422),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
            : SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Conversation Summary",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Here’s the summary of your conversation with Sunny.",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 20),

              // You mentioned that..
              const Text(
                "You mentioned that..",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  widget.userMentioned,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // To cope with it, you...
              const Text(
                "To cope with it, you....",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  widget.copingText,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Therefore
              const Text(
                "Therefore",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  widget.thereforeText,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Exit button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F3422),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Exit",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
