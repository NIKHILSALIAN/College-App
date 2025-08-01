import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9370DB), // gradient feel like image
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileField(Icons.badge, 'Student ID', 'STU2025001'),
                  _buildProfileField(Icons.person, 'Full Name', 'Hardik Patil'),
                  _buildProfileField(Icons.home, 'Address', 'Palghar, Maharashtra'),
                  _buildProfileField(Icons.phone, 'Contact Number', '+91 9876543210'),
                  _buildProfileField(Icons.email, 'Email', 'hardik@example.com'),
                  _buildProfileField(Icons.lock, 'Password', '********'),
                  _buildProfileField(Icons.calendar_today, 'Date of Birth', '17 Nov 2000'),
                  _buildProfileField(Icons.transgender, 'Gender', 'Male'),
                  _buildProfileField(Icons.school, 'Stream', 'Computer Science'),
                  _buildProfileField(Icons.class_, 'Class', 'SY BSc CS'),

                  const SizedBox(height: 20),

                  // ----------------- Logout Button -----------------
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add logout logic
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),

          // ----------------- Edit Icon Button (Bottom Right) -----------------
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              heroTag: 'edit_profile_btn',
              mini: true,
              onPressed: () {
                // Navigate to Edit Profile Page
              },
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),// make it square-ish
              ),
              child: const Icon(Icons.edit, color: Colors.deepPurpleAccent),
            ),
          )
        ],
      ),
    );
  }

  // ----------------- Field Display Widget -----------------
  Widget _buildProfileField(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withValues(alpha: 128),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepPurple.shade400),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

