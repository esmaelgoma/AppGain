
import 'package:app_gain/push_notification.dart';
import 'package:app_gain/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

Future<void> initUniLinks(BuildContext context) async {
  getUriLinksStream().listen((Uri? uri) {
    if (uri != null) {
      handleDeepLink(uri , context);
    }
  }, onError: (dynamic error) {});
}

getUriLinksStream() {
}

void handleDeepLink(Uri uri , BuildContext context) {
  if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'movie') {
    final movieId = int.tryParse(uri.pathSegments[1] ?? '');
    if (movieId != null) {
      // Navigate to movie detail screen using the movie ID

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  MovieDetails(id:movieId),),

      );
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
      initUniLinks(context) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home:  const SplashScreen(),

    );
  }

}




