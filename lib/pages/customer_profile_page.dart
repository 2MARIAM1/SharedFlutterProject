import 'package:flutter/material.dart';
import 'package:test_project/Components/custom_button.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../Components/custom_menu_cleaner.dart';
import '../models/user.dart';
import '../utils/image_constant.dart';

import 'edit_profile_cleaner.dart';
import 'loginpage.dart';

class CustomerProfileScreen extends StatefulWidget {
  final User currentUser;
  const CustomerProfileScreen({Key? key, required this.currentUser}) : super(key: key);
  User get user => currentUser;
  @override
  _CustomerProfileScreenState createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: ColorConstant.indigoA100,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Name',
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                        Text(widget.currentUser.fullName!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                        Text(widget.currentUser.email!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                        Text(widget.currentUser.phoneNumber!)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                        Text(
                          widget.currentUser.cin!,
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Region',
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                        Text(
                          widget.currentUser.region!,
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),

                  buildCustomButton(context, "Edit", (){})

                ],
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: CustomMenuBar(currentUser: widget.currentUser,)),
        ],
      ),
    );
  }
}