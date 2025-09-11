import 'package:flutter/material.dart';
import 'package:uplift/controller/usercontroller.dart';
import 'package:uplift/model/usermodel.dart';
import 'package:uplift/page/bottomnav.dart';
import 'package:uplift/page/homescreen.dart';
import 'package:uplift/page/passwordrecovery.dart';
import 'package:uplift/page/signupscreen.dart';

class Signin extends StatefulWidget {
  const Signin({super.key,});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController userController = UserController();

  // Validation methods
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Show loading dialog
      _showLoadingDialog();

      // All validation passed - ready for backend handling
      String username = _usernameController.text;
      String password = _passwordController.text;

      // Getting sign up result process
      User? user = await userController.userSignIn(username, password);

      // Close the loading dialog
      Navigator.of(context).pop();

      // Handle result
      if (user != null) {
        // Navigate to home screen after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Bottomnav()),
        );
      } else {
        // Show error message if signup failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed. Please try again.')),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Logo
                const Image(
                  image: AssetImage('media/Logo.png'),
                  width: 350,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 34),

                // Title
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF4F3422),
                  ),
                ),

                // Username field
                Container(
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
                        controller: _usernameController,
                        validator: _validateUsername,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'acaddd',
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

                // Password field
                Container(
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
                        controller: _passwordController,
                        validator: _validatePassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: '********',
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
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
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

                const SizedBox(height: 10),

                // Forgot password
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordRecovery()),
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

                // Sign in button
                ElevatedButton(
                  onPressed: _submitForm,
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

                const SizedBox(height: 30),

                // Sign up link
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
                              MaterialPageRoute(
                                  builder: (context) => const Signup()),
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
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDF6D14)),
                ),
                SizedBox(width: 20),
                Text("Signing in..."),
              ],
            ),
          ),
        );
      },
    );
  }
}