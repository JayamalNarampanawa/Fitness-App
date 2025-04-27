import 'dart:io'; // Import File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // Permission handler
import 'package:flutter/services.dart';

import 'settings.dart'; // Import the Settings screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  XFile? _profileImage; // Store the selected image

  @override
  void initState() {
    super.initState();
    // Initial permission request
    _requestPermissions();
  }

  // Request permissions for camera and gallery
  Future<void> _requestPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final mediaStatus = await Permission.photos.request();

    if (cameraStatus.isGranted && mediaStatus.isGranted) {
      // Show the dialog if permissions are granted
      _showImageSourceDialog();
    } else {
      if (cameraStatus.isDenied || mediaStatus.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission denied. Please grant permission to proceed.")),
        );
      }
      openAppSettings(); // Opens settings if permissions are denied
    }
  }

  // Show dialog to choose image source (Gallery or Camera)
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose Profile Picture"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Take a New Picture"),
                onTap: () {
                  _pickImageFromCamera();
                  Navigator.pop(context); // Close dialog
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_album),
                title: const Text("Choose from Gallery"),
                onTap: () {
                  _pickImageFromGallery();
                  Navigator.pop(context); // Close dialog
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Remove Profile Picture"),
                onTap: () {
                  setState(() {
                    _profileImage = null; // Remove profile picture
                  });
                  Navigator.pop(context); // Close dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Pick image from camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
    }
  }

  // Pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile;
      });
    }
  }

  // Save Profile and navigate
  void _saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Saved Successfully"),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  GestureDetector(
                    onTap: _showImageSourceDialog, // Show dialog on tapping profile picture
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: _profileImage == null
                          ? const AssetImage("assets/j.jpg") as ImageProvider
                          : FileImage(File(_profileImage!.path)), // Corrected image display
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Edit Profile Picture",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Full Name", nameController),
                  _buildTextField("Email", emailController, isEmail: true),
                  _buildTextField("Contact Number", contactController),
                  _buildWeightHeightField("Weight", weightController, "kg"),
                  _buildWeightHeightField("Height", heightController, "cm"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Save", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Text field widget for general inputs
  Widget _buildTextField(String label, TextEditingController controller, {bool isEmail = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              hintText: label,
              hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          ),
        ],
      ),
    );
  }

  // Weight and Height input field widget
  Widget _buildWeightHeightField(String label, TextEditingController controller, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                hintText: label,
                hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(width: 10),
          Text(unit, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}
