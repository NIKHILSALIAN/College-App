import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final Color lightPurple = const Color(0xFFF3F0FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🏫 School Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'), // Replace with your school logo
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Annasaheb Vartak College',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text('Vasai Road', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none, size: 28),
                ],
              ),
            ),

            // 👨‍🎓 Student Info Section
            Stack(
              children: [
                Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/classroom.jpg'), // Replace with your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Positioned(
                  left: 32,
                  top: 8,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/student.png'), // Replace with student image
                        radius: 28,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mahesh Suhas Pansare',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Sr. KG - A', style: TextStyle(color: Colors.white)),
                          Text('SS09-Dudulgaon', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🗓 Today's Schedule
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Schedule",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text('24 FEB 2025', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Today's Schedule is Not Available",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📚 Academics Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    buildAcademicCard('Time Table', Icons.calendar_today, Colors.blue),
                    buildAcademicCard('Attendance', Icons.verified_user, Colors.green),
                    buildAcademicCard('Homework', Icons.edit_note, Colors.teal),
                    buildAcademicCard('Fees', Icons.account_balance_wallet, Colors.orange),
                    buildAcademicCard('Messages', Icons.chat, Colors.purple),
                    buildAcademicCard('Exam', Icons.assessment, Colors.pink),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔻 Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        currentIndex: 1, // Classroom selected
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Classroom'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // 🔳 Academic Tile Widget
  Widget buildAcademicCard(String title, IconData icon, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withAlpha((0.1 * 255).toInt()), // Replaces deprecated withOpacity
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: bgColor, size: 30),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: bgColor),
          ),
        ],
      ),
    );
  }
}
