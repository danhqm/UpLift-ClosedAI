import 'package:flutter/material.dart';
import 'package:uplift/page/homescreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView( // 👈 Wrap with scroll view
          padding: const EdgeInsets.all(16), // Optional padding
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('media/Logo.png'),
                  width: 350,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4F3422),
                  ),
                ),
                // Username field
                Form(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 343,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Username',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'jerry_chan',
                            labelStyle: TextStyle(
                              color: Color(0xFF736B66),
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: Color(0xFF4F3422),
                            ),
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
                        )
                      ],
                    ),
                  ),
                ),
                // Email field
                Form(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 343,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Email Address',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                        const SizedBox(height: 8),
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
                        )
                      ],
                    ),
                  ),
                ),
                Form(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 343,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Color(0xFF736B66),
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Color(0xFF4F3422),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: const Color(0xFFC9C7C5),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color(0xFFDF6D14),
                                width: 2,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                color: Color(0xFF736B66),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Form(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 343,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: const TextStyle(
                              color: Color(0xFF736B66),
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_outline_rounded,
                              color: Color(0xFF4F3422),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: const Color(0xFFC9C7C5),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Color(0xFFDF6D14),
                                width: 2,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              borderSide: BorderSide(
                                color: Color(0xFF736B66),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDF6D14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    minimumSize: const Size(343, 56),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
