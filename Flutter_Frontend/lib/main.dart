import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';
<<<<<<< HEAD
import 'forgot_password_page.dart';
=======

>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9

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

<<<<<<< HEAD
      // ✅ Initial screen
=======
>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
      initialRoute: '/',

      // ✅ Named Routes (no spaces)
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MyHomePage(title: 'Vartak College App'),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
<<<<<<< HEAD
        '/student-dashboard': (context) => StudentDashboard(),
        '/teacher-dashboard': (context) => TeacherDashboard(),
        '/forgot-password': (context) => const ForgotPasswordPage(),

=======
        '/student dashboard': (context) => StudentDashboard(),
        '/teacher dashboard' :(context) => TeacherDashboard(),
>>>>>>> d6e1685946fd7fdc05da35e8afa640cb87917bb9
      },
    );
  }
}
