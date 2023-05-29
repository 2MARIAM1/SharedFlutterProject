import 'package:flutter/material.dart';
import 'package:test_project/Components/custom_button.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../Components/custom_menu_cleaner.dart';
import '../models/user.dart';
import '../utils/image_constant.dart';

import 'edit_profile_cleaner.dart';
import 'loginpage.dart';

class CleanerProfileScreen extends StatefulWidget {
  final User currentUser;
  const CleanerProfileScreen({Key? key, required this.currentUser}) : super(key: key);
  User get user => currentUser;
  @override
  _CleanerProfileScreenState createState() => _CleanerProfileScreenState();
}

class _CleanerProfileScreenState extends State<CleanerProfileScreen> {

  void _logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    // Action à effectuer lorsque le bouton de déconnexion est pressé
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage(currentUser: widget.currentUser,)),
    );
    // Action à effectuer lorsque le bouton "Edit" est pressé
  }

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
                          widget.currentUser.cleaning_types!.join(', '),
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
                          'Work-days',
                          style: TextStyle(fontSize: 14,fontFamily: 'Poppins'),
                        ),
                        Text(
                          widget.currentUser.workdays!.join(', '),
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

                  buildCustomButton(context, "Edit", _editProfile)

                ],
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: CustomMenuBarCleaner(currentUser: widget.currentUser,)),
        ],
      ),
    );
  }
}