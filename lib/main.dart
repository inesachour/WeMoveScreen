import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wemove_test/constants/http_client.dart';
import 'package:wemove_test/ui/screens/activity_screen.dart';
import 'package:wemove_test/core/view_models/cart_view.dart';


void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartView(),
      child: MyApp(),
    ),
  );
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
