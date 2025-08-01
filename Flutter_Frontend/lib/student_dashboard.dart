import 'package:flutter/material.dart';

<<<<<<< HEAD
<<<<<<< HEAD
/*
// Entry point of your app
void main() {
  runApp(StudentDashboard());
}

// Wrapper to launch your screen
class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Dashboard',
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
*/

class StudentDashboard extends StatefulWidget {
  @override
  State<StudentDashboard> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<StudentDashboard> {
  final Color darkPurple = Color(0xFF5A4FCF);
  final Color lightPurple = Color(0xFFF3F0FF);
  final Color redButton = Color(0xFFFF5F5F);     // Deactivate
  final Color greenButton = Color(0xFF4CAF50);   // Activate

  bool isAttendanceActive = false; // Track current state
=======
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f
class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  final Color lightPurple = const Color(0xFFF3F0FF);
<<<<<<< HEAD
>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
<<<<<<< HEAD
<<<<<<< HEAD
      body: Column(
        children: [

          // Top App Bar
          Container(
            color: darkPurple,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              children: [
                Icon(Icons.menu, color: Colors.white, size: 28),
                SizedBox(width: 16),
                Text(
                  'Student Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
=======
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f
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
<<<<<<< HEAD
>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f
                  ),
                ),
              ],
            ),
<<<<<<< HEAD
<<<<<<< HEAD
          ),

          SizedBox(height: 20),

          // Toggle Button with Color Change
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isAttendanceActive = !isAttendanceActive;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isAttendanceActive ? greenButton : redButton, // SWITCH
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                isAttendanceActive ? 'Active' : 'Deactivate',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 20),

          // 4 Grid Components
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

          Divider(
            color: darkPurple,
            thickness: 2,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 20),
=======
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f

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
<<<<<<< HEAD
>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f
        ],
      ),
    );
  }

<<<<<<< HEAD
<<<<<<< HEAD
  Widget dashboardItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: lightPurple,
        border: Border.all(color: darkPurple, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: darkPurple, size: 40),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkPurple,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          )
=======
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f
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
<<<<<<< HEAD
>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
=======
>>>>>>> 35720dde050e3622a528b3cf4c220bcb8d26fa1f
        ],
      ),
    );
  }
}
