import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'signup.dart';
import 'package:login/welcome.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // static const IconData account_circle = IconData(0xe853, fontFamily: 'MaterialIcons');1
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: new ThemeData(
          primaryTextTheme: Typography(platform: TargetPlatform.android).white,
          textTheme: Typography(platform: TargetPlatform.android).white,
          primaryColor: Color(0xFF606687)),
      // Signup.tag: (context) => Signup(),
  initialRoute: '.',
      routes: {
        '.': (context) => Login(),
        '/signup' :(context) => Signup(),
        '/welcome' :(context) => Welcome()
              }, 
    );
  }
}
