import 'package:flutter/material.dart';
import 'package:wemove_test/screens/activity_screen.dart';
import 'package:wemove_test/screens/panier_screen.dart';

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
      title: 'WeMove',
      home: ActivityScreen(),
    );
  }
}
