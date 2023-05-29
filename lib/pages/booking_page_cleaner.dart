import 'package:flutter/material.dart';
import 'package:test_project/Components/booked_posts_cleaner.dart';
import 'package:test_project/Components/custom_grid.dart';
import 'package:test_project/Components/custom_menu_cleaner.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../models/user.dart';

class MyBookingsCleanerPage extends StatefulWidget {
  final User currentUser;
  const MyBookingsCleanerPage({Key? key, required this.currentUser}) : super(key: key);
  User get user => currentUser;
  @override
  _MyBookingsCleanerPageState createState() => _MyBookingsCleanerPageState();
}

class _MyBookingsCleanerPageState extends State<MyBookingsCleanerPage> {
  bool _isPage1Visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .padding
                  .top + 16),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Booked services",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      color: ColorConstant.indigoA100,
                      fontWeight: FontWeight.w600),
                ),
              ),

              BookedPostsListCleaner(currentUser: widget.currentUser)
            ],

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomMenuBarCleaner(currentUser: widget.currentUser,),
          ),
        ],
      ),
    );
  }

}

