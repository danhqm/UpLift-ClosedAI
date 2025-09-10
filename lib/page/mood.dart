import 'package:flutter/material.dart';
import 'package:uplift/page/diarydetails.dart';

class Mood extends StatelessWidget {
  const Mood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: const Color(0xFFDF6D14),
        shape: const CircleBorder(),
        child: const Icon(Icons.bookmark_add_outlined, color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 20, bottom: 8),
                child: Text(
                  "Mood Tracking",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 25, right: 50, bottom: 20),
                child: Text(
                  "A safe space for your emotions, thoughts and reflection.",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF736B66),
                  ),
                ),
              ),

              // Search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Search your entries',
                    labelStyle: TextStyle(
                      color: Color(0xFF736B66),
                      fontFamily: 'Inter',
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(Icons.search, color: Color(0xFF4F3422)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Color(0xFFDF6D14),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color(0xFF736B66),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Diary Entries",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Column(
                children: [
                  DiaryEntryCard(
                    title: "Midterm Pressure",
                    date: "29/06/2025",
                    description:
                    "Today felt a little bit challenging. I have my midterms next week and I feel the pressure building up...",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Diarydetails(
                              title: "Midterm Pressure",
                              date: "29/06/2025",
                              description: "Today felt a little bit challenging. I have my midterms next week and I feel the pressure building up...")
                        ),
                      );
                    },
                  ),
                  DiaryEntryCard(
                    title: "Grateful Day",
                    date: "05/07/2025",
                    description:
                    "Feeling really grateful for my supportive friends and family today. I managed to finish my tasks on time...",
                    onTap: () {},
                  ),
                  DiaryEntryCard(
                    title: "Relaxing Evening",
                    date: "08/07/2025",
                    description:
                    "Had a quiet evening, listened to music, and wrote down my thoughts...",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ------------------ Diary Card Widget ------------------

class DiaryEntryCard extends StatelessWidget {
  final String title;
  final String date;
  final String description;
  final VoidCallback onTap;

  const DiaryEntryCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      "Date: ",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF9BB068),
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF9BB068),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                SizedBox(
                  height: 60,
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF4B3425),
                    ),
                  ),
                ),
              ],
            ),
          ),


          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(color: Color(0xFFDF6D14), width: 2),
            ),
            onPressed: onTap,
            child: const Icon(
              Icons.arrow_forward,
              color: Color(0xFFDF6D14),
            ),
          ),
        ],
      ),
    );
  }
}


