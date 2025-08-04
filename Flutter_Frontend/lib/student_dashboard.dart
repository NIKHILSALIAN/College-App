import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: StudentDashboard(),
    debugShowCheckedModeBanner: false,
  ));
}

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final Color darkPurple = const Color(0xFF5A4FCF);
  final Color lightPurple = const Color(0xFFF3F0FF);
  final Color redButton = const Color(0xFFFF5F5F);
  final Color greenButton = const Color(0xFF4CAF50);

  bool isAttendanceActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Container(
              color: darkPurple,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  const Icon(Icons.menu, color: Colors.white, size: 28),
                  const SizedBox(width: 16),
                  const Text(
                    'Student Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // School Info
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

            // Student Info
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
                        backgroundImage: AssetImage('assets/student.png'),
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

            const SizedBox(height: 20),

            // Toggle Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAttendanceActive = !isAttendanceActive;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAttendanceActive ? greenButton : redButton,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  isAttendanceActive ? 'Active' : 'Deactivate',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Dashboard Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    dashboardItem(Icons.pie_chart, 'Track your\nAttendance'),
                    dashboardItem(Icons.person, 'Profile'),
                    dashboardItem(Icons.calendar_month, 'Timetable'),
                    dashboardItem(Icons.campaign, 'Notice'),
                  ],
                ),
              ),
            ),

            const Divider(thickness: 2),

            const SizedBox(height: 16),

            // Today's Schedule
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Today's Schedule",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('24 FEB 2025', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),

            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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

            // Academics Grid
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

  Widget dashboardItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: lightPurple,
        border: Border.all(color: darkPurple, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: darkPurple, size: 40),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkPurple,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }

  Widget buildAcademicCard(String title, IconData icon, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.1),
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
