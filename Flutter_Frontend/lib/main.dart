import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MyHomePage(title: 'Vartak College App'),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
<<<<<<< HEAD
        '/student dashboard': (context) => StudentDashboard(),
      
      },
=======
        '/student dashboard':(context) => StudentDashboard(),
        '/teacher dashboard':(context) => TeacherDashboard(),
      }
>>>>>>> 0ceb99f2626bcb5b313775b39f86a1c0993e3422
    );
  }
}
