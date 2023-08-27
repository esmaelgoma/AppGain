
import 'package:app_gain/screens/movie_list.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MovieList()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children:
          [
            Expanded(
              child: Center(
                 child: Image.asset("assets/images/movies-app.png",
                   height: 250,width: 300,
                 ),
              ),
            ),
            const Text("Developer by Esmael Goma",style:TextStyle(color: Colors.grey),),
          ],
        ),
      ),
    );
  }
}
