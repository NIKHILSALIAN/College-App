import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // ✅ Correct import
import 'face_capture_page.dart';    // ✅ Make sure this file exists
import 'api_service.dart';

class RegisterPage extends StatefulWidget {
  final List<CameraDescription> cameras; // ✅ store cameras

  const RegisterPage({super.key, required this.cameras}); // ✅ receive cameras

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
  final TextEditingController dobController = TextEditingController();

  String? selectedGender;
  String? selectedStream;
  String? selectedClass;

  final Map<String, List<String>> classOptions = {
    'Science': ['BSc IT', 'BSc CS', 'MSc IT', 'MSc CS'],
    'Commerce': ['BCom', 'MCom'],
    'Arts': ['BA'],
  };

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

                _buildDatePicker(),

                _buildDropdown(
                  value: selectedGender,
                  hint: "Select Gender",
                  icon: Icons.transgender,
                  items: ['Male', 'Female', 'Other'],
                  onChanged: (value) => setState(() => selectedGender = value),
                ),

                _buildDropdown(
                  value: selectedStream,
                  hint: "Select Stream",
                  icon: Icons.book,
                  items: classOptions.keys.toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedStream = value;
                      selectedClass = null;
                    });
                  },
                ),

                if (selectedStream != null)
                  _buildDropdown(
                    value: selectedClass,
                    hint: "Select Class",
                    icon: Icons.class_,
                    items: classOptions[selectedStream]!,
                    onChanged: (value) => setState(() => selectedClass = value),
                  ),

                const SizedBox(height: 25),

                /// 📷 Capture Face Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                         builder: (_) => FaceCapturePage(cameras: widget.cameras), // ✅ pass cameras here
                        ),
                      );
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Capture Face"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// 🔘 Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await ApiService.registerStudent({
                          "studentId": studentIdController.text,
                          "name": nameController.text,
                          "address": addressController.text,
                          "contactNumber": contactController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "dob": dobController.text,
                          "gender": selectedGender,
                          "stream": selectedStream,
                          "studentClass": selectedClass,
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

  Widget _buildDatePicker() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: dobController,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2005),
            firstDate: DateTime(1990),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            setState(() {
              dobController.text = pickedDate.toIso8601String().split('T')[0];
            });
          }
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_today, color: Colors.white),
          hintText: "Date of Birth",
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: (value) => value == null || value.isEmpty ? "Required" : null,
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required IconData icon,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        dropdownColor: Colors.deepPurple.shade200,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item, style: const TextStyle(color: Colors.black)),
                ))
            .toList(),
        onChanged: onChanged,
        validator: (value) => value == null ? "Required" : null,
      ),
    );
  }
}




