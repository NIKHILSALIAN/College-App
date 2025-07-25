import 'package:flutter/material.dart';


class TeacherDashboard extends StatefulWidget {
  @override
  State<TeacherDashboard> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<TeacherDashboard> {
  final Color darkPurple = Color(0xFF5A4FCF);
  final Color lightPurple = Color(0xFFF3F0FF);
  final Color greenButton = Color(0xFF4CAF50);  

  bool isAttendanceActive = false; // Track current state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  'Teacher Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Simple Button
          Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // This is where you will later call Spring Boot API
              print("Attendance getting started!");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: greenButton, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text(
              'Get Attendance',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                 
                  dashboardItem(Icons.person, 'Profile'),
                  dashboardItem(Icons.book, 'Catalougue'),
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
              ],
            ),
          );
        }
      }
