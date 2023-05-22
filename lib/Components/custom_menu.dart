import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';

class CustomMenuBar extends StatelessWidget {
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
              // Handle home button pressed
            },
          ),
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgGroupmybooking),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              // Handle search button pressed
            },
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            //  alignment: Alignment.topCenter,
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)]),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: IconButton(
                icon: SvgPicture.asset(ImageConstant.imgPlus),
                // icon: Icon(Icons.message_outlined),
                onPressed: () {
                  // Handle search button pressed
                },
              ),
            ),
          ),
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgMessage),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              // Handle search button pressed
            },
          ),
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgUserBlack),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              // Handle search button pressed
            },
          ),
        ],
      ),
    );
  }
}
