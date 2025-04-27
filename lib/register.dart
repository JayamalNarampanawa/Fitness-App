//importing packages and screens
import 'package:fitness_app/termsconditions.dart';
import 'package:flutter/material.dart';
import 'login.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? selectedGender;
  final TextEditingController _genderController = TextEditingController();
  bool _isTermsAccepted = false; // Tracks checkbox state

  void _registerUser() {
    if (_isTermsAccepted) {
      // Show "Registration Successful" message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration Successful"),
          backgroundColor: Colors.green,
        ),
      );

      // Delay navigation for 2 seconds to show the message
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      });
    } else {
      // Show error if terms are not accepted
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You must accept the terms and conditions"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
//UI
    //BG
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        //Title
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "REGISTER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //txt fields
              const SizedBox(height: 20),
              _buildTextField("First Name"),
              const SizedBox(height: 10),
              _buildTextField("Last Name"),
              const SizedBox(height: 10),
              _buildTextField("Email"),
              const SizedBox(height: 10),
              _buildTextField("Contact Number"),
              const SizedBox(height: 10),
              _buildTextField("Password", isPassword: true),
              const SizedBox(height: 10),
              _buildTextField("Confirm Password", isPassword: true),
              const SizedBox(height: 10),

              // Gender & Birthday Row
              Row(
                children: [
                  Expanded(child: _buildGenderField("Gender")),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTextField("Birthday")),
                ],
              ),
              const SizedBox(height: 10),

              // Weight & Height Row
              Row(
                children: [
                  Expanded(child: _buildTextField("Weight")),
                  const SizedBox(width: 10),
                  Expanded(child: _buildTextField("Height")),
                ],
              ),
              const SizedBox(height: 10),

              // Terms and Conditions Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (value) {
                      setState(() {
                        _isTermsAccepted = value!;
                      });
                    },
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                  ),
                  const Text("I agree to the ", style: TextStyle(color: Colors.white)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()),
                      );
                    },
                    child: const Text(
                      "terms and conditions",
                      style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //SIGN UP Btton
              _buildButton("SIGN UP", onTap: _registerUser),
            ],
          ),
        ),
      ),
    );
  }
//pw
  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildGenderField(String hint) {
    return TextField(
      controller: _genderController,
      readOnly: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        //gender drop down menue
        suffixIcon: PopupMenuButton<String>(
          color: Colors.black87,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          onSelected: (String value) {
            setState(() {
              selectedGender = value;
              _genderController.text = value;
            });
          },
          //drop down menue value for the textbox
          itemBuilder: (BuildContext context) {
            return ["Male", "Female", "Other"].map((String value) {
              return PopupMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _buildButton(String text, {required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
