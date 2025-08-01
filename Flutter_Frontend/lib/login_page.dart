import 'package:flutter/material.dart';
import 'api_service.dart'; // Make sure this is correctly imported

import 'api_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock, size: 60, color: Colors.white),
                const SizedBox(height: 20),
                const Text(
                  'Student Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // Email or Contact Input
                TextField(
                  controller: emailOrPhoneController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                    hintText: 'Email or Contact Number',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Input
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                // 🔑 Forgot Password Button (Step 1)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
<<<<<<< HEAD
                    onPressed: () async {
                      final emailOrPhone = emailOrPhoneController.text.trim();
                      final password = passwordController.text.trim();

                      if (emailOrPhone.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("❗ All fields are required")),
                        );
                        return;
                      }

                      final response = await ApiService.loginStudent({
                        "emailOrContact": emailOrPhone,
                        "password": password,
                      });

                      if (response.statusCode == 200) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("✅ Login successful")),
                        );

                        // ✅ Navigate to student dashboard after login
                        Navigator.pushReplacementNamed(context, '/student-dashboard');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("❌ Login failed: ${response.body}")),
                        );
                      }
=======
                    onPressed: () { //API CALL
                      onPressed:
                      () async {
                        final emailOrPhone = emailOrPhoneController.text.trim();
                        final password = passwordController.text.trim();

                        if (emailOrPhone.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("❗ All fields are required")),
                          );
                          return;
                        }

                        final response = await ApiService.loginStudent({
                          "emailOrContact": emailOrPhone,
                          // Make sure Spring Boot accepts this key
                          "password": password,
                        });

                        if (response.statusCode == 200) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("✅ Login successful")),
                          );

                          // Navigate to dashboard or home
                          Navigator.pushReplacementNamed(context,
                              '/student dashboard'); // 🔁 Change this to your actual route
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("❌ Login failed: ${response
                                .body}")),
                          );
                        }
                      };

>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Login'),
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
