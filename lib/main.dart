import 'package:flutter/material.dart';
import 'package:fluttertraining/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          
        )
      ),
      home: LoginPage(),
    );
  }
}
