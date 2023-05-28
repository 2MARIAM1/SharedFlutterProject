import 'package:flutter/material.dart';

import 'package:test_project/pages/addservices.dart';
import 'package:test_project/pages/chat.dart';
import 'package:test_project/pages/loginpage.dart';
import 'package:test_project/pages/profi-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
