import 'package:arvind/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomSplash(
        imagePath: 'assets/logo.png',
        animationEffect: 'zoom-in',
        logoSize: 150,
        duration: 2500,
        type: CustomSplashType.StaticDuration,
        home: HomePage() 
      ),
    );
}

}