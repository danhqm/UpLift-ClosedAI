import 'package:flutter/material.dart';
import 'package:uplift/page/bottomnav.dart';
import 'package:uplift/page/diarydetails.dart';

class Mood extends StatefulWidget {
  const Mood({super.key});

  @override
  State<Mood> createState() => _MoodState();
}

class _MoodState extends State<Mood> {


  void _showMoodOverlay(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFFF7F4F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 338,
            height: 472,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "How do you feel today?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF4F3422),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Choose your likely mood for today",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF736B66),
                    ),
                  ),
                  const SizedBox(height: 70),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _moodButton(context, "Neutral", imagePath: "media/Neutral.png"),
                      _moodButton(context, "Sad", imagePath: "media/Sad.png"),
                      _moodButton(context, "Upset", imagePath: "media/Upset.png"),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _moodButton(context, "Excited", imagePath: "media/Excited.png"),
                      _moodButton(context, "Happy", imagePath: "media/Happy.png"),
                    ],
                  ),

                  const Spacer(),

                  SizedBox(
                    width: 318,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F3422),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Close",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void _showConfirmOverlay(BuildContext context, String mood, String imagePath) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFFF7F4F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 338,
            height: 405,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You’re feeling..", style: _titleStyle),
                  const SizedBox(height: 45),
                  Image.asset(imagePath, width: 60, height: 60),
                  const SizedBox(height: 8),
                  Text(mood, style: _subtitleStyle),
                  const SizedBox(height: 10),
                  const Text(
                    "I’m sorry to hear that. Wanna read some tips on handling it or write a diary?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal , fontFamily: 'Inter', color: Color(0xFF4B3425)),
                  ),
                  const Spacer(),

                  SizedBox(
                    width: 318,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F3422),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        _showDiaryOverlay(context);
                      },
                      child: const Text(
                        "Write a Diary",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  void _showDiaryOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 358,
            height: 513,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Write a Diary", style: _titleStyle),
                  const SizedBox(height: 3),
                  const Text(
                    "Let’s answer this question.",
                    style: TextStyle(color: Color(0xFF736B66)),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3, // 3 per row
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: [
                        _categoryChip("Work", Icons.work_outline),
                        _categoryChip("Health", Icons.favorite_border_outlined),
                        _categoryChip("Relationships", Icons.people_outline),
                        _categoryChip("Financial", Icons.attach_money_outlined),
                        _categoryChip("Environment", Icons.eco_outlined),
                        _categoryChip("Not sure", Icons.help_outline),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4B3425),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          _showSubmitOverlay(context);
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSubmitOverlay(BuildContext context) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xFFF7F4F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 338,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Write a Diary", style: _titleStyle),
                  const SizedBox(height: 3),
                  const Text(
                    "Pour out your heart. There are no judgements here.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Inter',
                      color: Color(0xFF4B3425),
                    ),
                  ),
                  const SizedBox(height: 10),


                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        expands: true,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "Start writing your diary here...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F3422),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bottomnav(),
                          ),
                        );
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }




  Widget _moodButton(BuildContext context, String label, {String? emoji, String? imagePath}) {
    return GestureDetector(
      onTap: () => _showConfirmOverlay(context, label, emoji ?? imagePath ?? ""),
      child: Column(
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath,
              width: 50,
              height: 55,
            )
          else if (emoji != null)
            Text(emoji, style: const TextStyle(fontSize: 40)),

          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }


  Widget _categoryChip(String text, IconData icon) {
    return SizedBox(
      width: 95,
      height: 95,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9BB068),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          // Handle selection
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(height: 6),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }




  final TextStyle _titleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Color(0xFF4F3422),
  );

  final TextStyle _subtitleStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Color(0xFF736B66),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMoodOverlay(context);
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


