import 'package:flutter/material.dart';
import 'package:message_app_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Chat Ui',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: "Poppins",
      ),
      home: const HomeScreen(),
    );
  }
}
