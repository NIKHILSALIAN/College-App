import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // ✅ import camera package

import 'splash_screen.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'student_dashboard.dart';
import 'teacher_dashboard.dart';

late List<CameraDescription> cameras; // ✅ define globally

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ ensure binding
  cameras = await availableCameras(); // ✅ get available cameras

  runApp(MyApp());
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
        '/': (context) => SplashScreen(),
        '/home': (context) => const MyHomePage(title: 'Vartak College App'),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(cameras: cameras),
        '/student_dashboard': (context) => StudentDashboard(),
        '/teacher_dashboard': (context) => TeacherDashboard(),
      },
    );
  }
}
