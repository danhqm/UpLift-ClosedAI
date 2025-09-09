import 'package:flutter/material.dart';
import 'package:uplift/page/passwordrecovery.dart';
import 'package:uplift/page/signupscreen.dart';
import 'package:uplift/page/welcomescreen.dart';


class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureText = true; //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage('media/Logo.png'),
                width: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 34),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF4F3422),
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
                          labelText: 'Username',
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
                          suffixIcon: IconButton( // 👈 eye button
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: const Color(0xFFC9C7C5),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText; // 👈 toggle state
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
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Passwordrecovery()),
                    );
                  },
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFDF6D14),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFDF6D14),
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Welcome()),
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
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text.rich(
                TextSpan(
                  text: 'Don\'t have an account? ',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF736B66),
                  ),
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Signup()),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFDF6D14),
                                width: 1.2,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDF6D14),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ]
        ),
      ),
    );
  }
}
