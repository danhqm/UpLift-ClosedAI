import 'package:flutter/material.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: const Color(0xFFE5EAD7),
          ),


          Positioned(
            top: 120,
            left: 0,
            right: 0,
            child: Image.asset(
              'media/Passwordrecover.png',
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content with scroll
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Back button
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF4F3422),
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFF4F3422),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Password Recovery Setup",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 350),

                // Curved white bottom sheet
                ClipPath(
                  clipper: CurvedTopClipper(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24.0),
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          "Code Verification",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Inter',
                            color: Color(0xFF4B3425),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "We will send a 6 digit code to your email.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF736B66),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Email input
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'abc@gmail.com',
                            labelStyle: TextStyle(
                              color: Color(0xFF736B66),
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color(0xFF4F3422),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color(0xFFDF6D14),
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                color: Color(0xFF736B66),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFDF6D14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Send 6 Digit Code",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(
      size.width / 2, -40, // 👈 adjust this for deeper curve
      size.width, 40,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
