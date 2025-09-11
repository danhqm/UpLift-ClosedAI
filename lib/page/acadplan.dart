import 'package:flutter/material.dart';
import 'addplan.dart';

class Acadplan extends StatefulWidget {
  final Function(int) onTabChange;

  const Acadplan({super.key, required this.onTabChange});

  @override
  State<Acadplan> createState() => _AcadplanState();
}

class _AcadplanState extends State<Acadplan> {
  // Modify sini gak
  final List<Map<String, String>> tasks = [
    {
      "title": "Assignment BITM",
      "description": "Description",
      "priority": "High",
      "deadline": "15 Sep 2025",
    },
    {
      "title": "Assignment BITM",
      "description": "Description",
      "priority": "Medium",
      "deadline": "20 Sep 2025",
    },
  ];

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void completeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFDF6D14),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddPlan(),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF000000), width: 2),
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
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () {
                        widget.onTabChange(5);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9BB068),
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
                          fontWeight: FontWeight.normal,
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
                  "Upcoming Deadlines",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: List.generate(tasks.length, (index) {
                    final task = tasks[index];
                    return academicPlanCard(
                      title: task["title"]!,
                      description: task["description"]!,
                      priority: task["priority"]!,
                      deadline: task["deadline"]!,
                      onRemove: () => removeTask(index),
                      onComplete: () => completeTask(index),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget academicPlanCard({
  required String title,
  required String description,
  required String priority,
  required String deadline,
  required VoidCallback onRemove,
  required VoidCallback onComplete,
}) {
  Color cardColor;
  switch (priority.toLowerCase()) {
    case "high":
      cardColor = const Color(0xFFBA2424);
      break;
    case "medium":
      cardColor = const Color(0xFFFFBD1A);
      break;
    case "low":
      cardColor = Colors.green.shade100;
      break;
    default:
      cardColor = Colors.white;
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: cardColor,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Priority: ",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: priority,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: priority.toLowerCase() == "high"
                              ? const Color(0xFFFFCE5C)
                              : priority.toLowerCase() == "medium"
                              ? const Color(0xFF4F3422)
                              : Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Deadline: $deadline",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFDADADA)),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(65, 28),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  onPressed: onRemove,
                  child: const Text(
                    "Remove",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4F3422),
                    ),
                  ),
                ),
                const SizedBox(width: 3),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFDADADA)),
                    backgroundColor: Color(0xFF3A7D44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(65, 28),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  onPressed: onComplete,
                  child: const Text(
                    "Complete",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
