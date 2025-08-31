import 'package:flutter/material.dart';
import '../utils/colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              buildTextField("Profile Name"),
              buildTextField("Mobile Number"),
              buildTextField("Phone Number"),
              buildTextField("WhatsApp Number"),
              buildTextField("Email ID"),
              buildTextField("GST Number"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 🔹 Save/update logic here
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.black),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
