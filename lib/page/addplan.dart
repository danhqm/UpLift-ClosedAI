import 'package:flutter/material.dart';

class AddPlan extends StatefulWidget {
  const AddPlan({super.key});

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  final TextEditingController _deadlineController = TextEditingController();
  String _priority = "High";

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF4F3422),
              onPrimary: Colors.white,
              onSurface: Color(0xFF4F3422),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _deadlineController.text =
        "${picked.day} ${_monthName(picked.month)} ${picked.year}";
      });
    }
  }

  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFF7F4F2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 340,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add New Plan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF4F3422),
                      ),
                    ),
                    const SizedBox(height: 20),
          
                    const Text(
                      "Task Name",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4F3422),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your task",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                      ),
                    ),
                    const SizedBox(height: 15),
          
                    // Description
                    const Text(
                      "Task Description",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4F3422),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: "Enter task description",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                      ),
                    ),
                    const SizedBox(height: 15),
          
                    const Text(
                      "Add Deadline",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4F3422),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _deadlineController,
                      readOnly: true,
                      onTap: () => _pickDate(context),
                      decoration: InputDecoration(
                        hintText: "Choose Date",
                        suffixIcon: const Icon(Icons.calendar_today),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                      ),
                    ),
                    const SizedBox(height: 15),
          
                    const Text(
                      "Priority Level",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4F3422),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: "High",
                              groupValue: _priority,
                              activeColor: Colors.redAccent,
                              onChanged: (value) {
                                setState(() {
                                  _priority = value!;
                                });
                              },
                            ),
                            const Text("High", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: "Medium",
                              groupValue: _priority,
                              activeColor: Colors.orangeAccent,
                              onChanged: (value) {
                                setState(() {
                                  _priority = value!;
                                });
                              },
                            ),
                            const Text("Medium", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: "Low",
                              groupValue: _priority,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  _priority = value!;
                                });
                              },
                            ),
                            const Text("Low", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDF6D14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print("Task Added with Priority: $_priority");
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Add Task",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          
              Positioned(
                top: 20,
                right: 15,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF4B3425),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
