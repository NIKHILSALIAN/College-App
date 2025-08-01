import 'dart:developer' as dev;



import 'package:flutter/material.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({super.key});

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  final Color lightPurple = const Color(0xFFF3F0FF);
  final Color greenButton = const Color(0xFF4CAF50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🏫 Header Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
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

            // 👩‍🏫 Teacher Info Section
            Stack(
              children: [
                Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/classroom.jpg'),
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
                        backgroundImage: AssetImage('assets/teacher.png'),
                        radius: 28,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nikhil R. Salian',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Computer Department', style: TextStyle(color: Colors.white)),
                          Text('ID: T-00012', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ Get Attendance Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    dev.log(
                      'Attendance started for students!',
                      name: 'AttendanceLogger', // optional name
                    );

                    //dev.log("Attendance started for students!");
                    // You’ll call your Spring Boot backend here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: greenButton,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Get Attendance',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 📚 2x2 Grid Options
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    buildGridCard('Profile', Icons.person, Colors.purple),
                    buildGridCard('Catalogue', Icons.menu_book, Colors.orange),
                    buildGridCard('Timetable', Icons.calendar_today, Colors.teal),
                    buildGridCard('Notice', Icons.campaign, Colors.blue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔻 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Classroom'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // 🔳 Grid Item Widget
  Widget buildGridCard(String title, IconData icon, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withAlpha((0.1 * 255).toInt()),
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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: bgColor),
          ),
        ],
      ),
    );
  }
}

