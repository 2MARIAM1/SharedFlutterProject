import 'package:flutter/material.dart';
import 'package:test_project/Components/SignUpComponents/service_selector.dart';
import 'package:test_project/pages/add_infos_cleaner.dart';
import 'package:test_project/pages/get_started.dart';
import 'package:test_project/pages/home_page_customer.dart';
import 'package:test_project/pages/loginpage.dart';
import 'package:test_project/pages/signup_page.dart';
import 'package:test_project/pages/booking_page_customer.dart';

import 'Components/date_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
    );
  }
}
