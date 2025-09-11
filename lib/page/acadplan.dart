import 'package:flutter/material.dart';
import 'addplan.dart';


class Acadplan extends StatelessWidget {
  final Function(int) onTabChange;

  const Acadplan({super.key, required this.onTabChange});

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
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 20),
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
                    SizedBox(width: 6),
                    ElevatedButton(
                      onPressed: () {
                        onTabChange(5);
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
                  ]
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
                  children: [
                    academicPlanCard(
                      title: "Assignment BITM",
                      description:
                      "Description",
                      priority: "High",
                      deadline: "15 Sep 2025",
                      onRemove: () {
                        print("Removed Assignment");
                      },
                      onComplete: () {
                        print("Completed Assignment");
                      },
                    ),
                    academicPlanCard(
                      title: "Assignment BITM",
                      description:
                      "Description",
                      priority: "Medium",
                      deadline: "20 Sep 2025",
                      onRemove: () {
                        print("Removed Study Plan");
                      },
                      onComplete: () {
                        print("Completed Study Plan");
                      },
                    ),
                  ],
                ),
              ),
            ]
          )
        ),
      )
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
  // Decide card background color based on priority
  Color cardColor;
  switch (priority.toLowerCase()) {
    case "high":
      cardColor = Color(0xFFBA2424); // light red
      break;
    case "medium":
      cardColor = Color(0xFFFFBD1A); // light yellow
      break;
    case "low":
      cardColor = Colors.green.shade100; // light green
      break;
    default:
      cardColor = Colors.white; // fallback
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
        // Title
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 6),

        // Description
        Text(
          description,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFFFFFFFF),
          ),
        ),
        const SizedBox(height: 16),

        // Bottom row with priority, deadline, and buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Priority + Deadline
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
                          color: Colors.white, // "Priority:" always white
                        ),
                      ),
                      TextSpan(
                        text: priority,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: priority.toLowerCase() == "high"
                              ? Color(0xFFFFCE5C)
                              : priority.toLowerCase() == "medium"
                              ? Color(0xFF4F3422)
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

            // Right side: Buttons
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFDADADA)),
                    backgroundColor: Color(0xFFFFFFFF),
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
                    backgroundColor: const Color(0xFF3A7D44),
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
                      color: Color(0xFFFFFFFF),
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
