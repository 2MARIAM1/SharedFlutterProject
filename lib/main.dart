import 'package:flutter/material.dart';
import 'package:test_project/Components/service_selector.dart';
import 'package:test_project/pages/get_started.dart';
import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/loginpage.dart';
import 'package:test_project/pages/signup_page.dart';
import 'package:test_project/pages/testpage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServiceTypeSelector(),
    );
  }
}
