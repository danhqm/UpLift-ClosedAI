import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uplift/controller/usercontroller.dart';
import 'package:uplift/page/passwordsuccessfull.dart';

class Digit extends StatefulWidget {
  final String email;
  final int code;
  final String password;


  const Digit({super.key, required this.code, required this.password, required this.email,});

  @override
  State<Digit> createState() => _DigitState();
}

class _DigitState extends State<Digit> {
  final UserController userController = UserController();
  String _enteredCode = "";
  String _errorMessage = "";

  Future<void> _verifyCode() async {
    if (_enteredCode != widget.code.toString()) {
      setState(() {
        _errorMessage = "Invalid code. Please try again.";
      });
    } else {
      bool result = await userController.resetPassword(widget.email, widget.password);
      if (!result) {
        setState(() {
          _errorMessage = "Error resetting password. Please try again.";
        });
        return;
      }
      setState(() {
        _errorMessage = "";
      });
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Passwordsuccessfull()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF7F4F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Back + Title
              Row(
                children: [
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

              const SizedBox(height: 100),

              const Text(
                'Enter 5 Digit Code',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4F3422),
                ),
              ),
              const SizedBox(height: 48),

              // Pin Code input
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                appContext: context,
                length: 5,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveColor: const Color(0xFF736B66),
                  selectedColor: const Color(0xFFDF6D14),
                  activeColor: const Color(0xFF4B3425),
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {
                  setState(() {
                    _enteredCode = value;
                  });
                },
                onCompleted: (value) {
                  _enteredCode = value;
                },
              ),

              // Error message
              if (_errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              const SizedBox(height: 30),

              // Continue button
              SizedBox(
                width: 343,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B3425),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: _verifyCode,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 50),

              // Resend text
              Text.rich(
                TextSpan(
                  text: 'Didn\'t receive the code? ',
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
                          // handle resend code
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
                            'Re-send',
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
            ],
          ),
        ),
      ),
    );
  }
}
