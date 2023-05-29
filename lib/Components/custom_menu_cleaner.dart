import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/Components/custom_grid.dart';
import 'package:test_project/pages/booking_page_cleaner.dart';
import 'package:test_project/pages/cleaner_home_page.dart';
import 'package:test_project/pages/cleaner_profile_page.dart';
import 'package:test_project/pages/loginpage.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';

import '../models/user.dart';
import '../pages/add_service_request.dart';
import '../pages/home_page_customer.dart';
import '../pages/booking_page_customer.dart';
import '../pages/testpage.dart';


class CustomMenuBarCleaner extends StatelessWidget {
  final User currentUser;

  const CustomMenuBarCleaner({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 85,
      decoration: BoxDecoration(
        gradient: ColorConstant.lightbluegradientMENU,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgHome),
            //  icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CleanerHomePage(currentUser: currentUser),
              ));
            },

          ),
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgGroupmybooking),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              print(currentUser.id);
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyBookingsCleanerPage(currentUser: currentUser),
                  ));
              
            },
          ),
         
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgUserBlack),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CleanerProfileScreen(currentUser: currentUser)),
              );
            },
          ),
          IconButton(
            alignment: Alignment.bottomCenter,
            icon:Icon(Icons.logout_rounded ),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );

            },
          ),
        ],
      ),
    );
  }
}
