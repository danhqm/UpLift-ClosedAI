import 'package:flutter/material.dart';

class Acadprogress extends StatefulWidget {
  final Function(int) onTabChange;
  const Acadprogress({super.key, required this.onTabChange});

  @override
  State<Acadprogress> createState() => _AcadprogressState();
}

class _AcadprogressState extends State<Acadprogress> {
  // Modify sini
  double tasksProgress = 0.7;
  double completedProgress = 0.7;
  String cgpaGoal = "3.35 / 3.75";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 20, bottom: 8),
                child: Text(
                  "Academic Planning",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25, right: 75, bottom: 20),
                child: Text(
                  "Manage your deadlines and reduce academic stress with our.",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.onTabChange(1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFDF6D14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(163, 45),
                      ),
                      child: const Text(
                        'Deadlines',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9BB068),
                        side: const BorderSide(color: Color(0xFF000000), width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(163, 45),
                      ),
                      child: const Text(
                        'Your Progress',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Your Progress",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: _buildProgressCard(
                  imagePath: 'media/ProgressCard.png',
                  title: 'Tasks',
                  progress: tasksProgress,
                  progressColor: const Color(0xFF9BB068),
                  subtitle: '5 ongoing',
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: _buildProgressCard(
                  imagePath: 'media/ProgressCheck.png',
                  title: 'Completed',
                  progress: completedProgress,
                  progressColor: const Color(0xFF3A7D44),
                  subtitle: '4 in this month',
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: _buildCgpaCard(
                  imagePath: 'media/ProgressCGPA.png',
                  title: 'CGPA Goal',
                  progress: completedProgress,
                  progressColor: const Color(0xFFDF6D14),
                  cgpaGoal: cgpaGoal,
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Need some help?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Academic Stress Management",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4F3422),
                                  ),
                                ),
                                SizedBox(height: 2),
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    "Evidence-based strategies to reduce academic pressure",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF736B66),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const TipCard(
                        imagePath: 'media/ProgressCGPA.png',
                        title: 'Break it down',
                        subtitle: 'Divide large assignments into smaller, manageable tasks',
                      ),
                      const TipCard(
                        imagePath: 'media/ProgressCGPA.png',
                        title: 'Set Realistic Goals',
                        subtitle: 'Focus on progress, not perfection. Prioritize what matters most.',
                      ),
                      const TipCard(
                        imagePath: 'media/ProgressCGPA.png',
                        title: 'Time Blocking',
                        subtitle: 'Allocate dedicated time slots for tasks to stay focused.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildProgressCard({
    required String imagePath,
    required String title,
    required double progress,
    required Color progressColor,
    required String subtitle,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF4F3422),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFE5EAD7),
                    color: progressColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF736B66),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCgpaCard({
    required String imagePath,
    required String title,
    required String cgpaGoal,
    required double progress,
    required Color progressColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF4F3422),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: const Color(0xFFFFCDA2),
                    color: progressColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  cgpaGoal,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF736B66),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const TipCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF4F3422),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF736B66),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
