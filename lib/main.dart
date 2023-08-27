import 'package:app_gain/push_notification.dart';
import 'package:app_gain/screens/movie_details.dart';
import 'package:app_gain/screens/movie_list.dart';
import 'package:app_gain/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( brightness: Brightness.dark),
      home:   const SplashScreen(),
    );
  }
}




