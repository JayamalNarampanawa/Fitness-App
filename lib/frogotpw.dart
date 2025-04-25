import 'package:flutter/material.dart';
import 'changepw.dart'; 
import 'dart:math';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String? _emailError;
  String? _otpError;
  String? _sentOtp;
  bool _otpSent = false;

  // generating an OTP (SIMUALTION)
  void _sendOTPToEmail() {
    final email = _emailController.text.trim();
    if (email.isEmpty || !email.contains('@')) {
      setState(() {
        _emailError = "Please enter a valid email address";
      });
      return;
    }

    setState(() {
      _emailError = null;
      _sentOtp = (100000 + Random().nextInt(900000)).toString(); // Generate 6-digit OTP( will show on Console)
      _otpSent = true;
      _otpError = null;
    });

    // Simulate sending OTP via email
    print("OTP sent to $email: $_sentOtp");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP has been sent to your email.")),
    );
  }

  // Verify OTP 
  void _verifyOtpAndProceed() {
    final enteredOtp = _otpController.text.trim();
  //navigate  of OTP is matched
    if (enteredOtp == _sentOtp) {
      setState(() => _otpError = null);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
      );
    } else {
      setState(() {
        _otpError = "Invalid OTP entered. Please try again.";
      });
    }
  }

  //UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home.jpeg"), 
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.black26,
                    errorText: _emailError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _sendOTPToEmail,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Send Email",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                if (_otpSent) ...[
                  const SizedBox(height: 30),
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Enter OTP",
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.black26,
                      errorText: _otpError,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _verifyOtpAndProceed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Verify",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
