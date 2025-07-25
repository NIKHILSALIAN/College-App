import 'package:flutter/material.dart';
import 'api_service.dart'; // ✅ Make sure this is imported to use ApiService

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController studentIdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController streamController = TextEditingController();
  final TextEditingController studentClassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.person_add, size: 60, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'Student Registration',
                  style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),

                _buildInput(studentIdController, "Student ID", Icons.badge),
                _buildInput(nameController, "Full Name", Icons.person),
                _buildInput(addressController, "Address", Icons.home),
                _buildInput(contactController, "Contact Number", Icons.phone),
                _buildInput(emailController, "Email", Icons.email),
                _buildInput(passwordController, "Password", Icons.lock, isObscure: true),
                _buildInput(ageController, "Age", Icons.numbers),
                _buildInput(dobController, "Date of Birth (YYYY-MM-DD)", Icons.calendar_today),
                _buildInput(genderController, "Gender", Icons.transgender),
                _buildInput(streamController, "Stream", Icons.book),
                _buildInput(studentClassController, "Class", Icons.class_),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                   //API CALL
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await ApiService.registerStudent({
                          "studentId": studentIdController.text,
                          "name": nameController.text,
                          "address": addressController.text,
                          "contactNumber": contactController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "age": int.tryParse(ageController.text) ?? 0,
                          "dob": dobController.text,
                          "gender": genderController.text,
                          "stream": streamController.text,
                          "studentClass": studentClassController.text,
                        });

                        if (response.statusCode == 200 || response.statusCode == 201) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("✅ Registration successful")),
                          );
                          Navigator.pushReplacementNamed(context, '/login');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("❌ Registration failed: ${response.body}")),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Register"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(TextEditingController controller, String hint, IconData icon, {bool isObscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) => value == null || value.isEmpty ? "Required" : null,
      ),
    );
  }
}
