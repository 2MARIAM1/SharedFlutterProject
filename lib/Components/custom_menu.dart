import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/Components/custom_grid.dart';
import 'package:test_project/pages/cleaner_profile_page.dart';
import 'package:test_project/pages/loginpage.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';

import '../models/user.dart';
import '../pages/add_service_request.dart';
import '../pages/customer_profile_page.dart';
import '../pages/home_page_customer.dart';
import '../pages/booking_page_customer.dart';
import '../pages/testpage.dart';


class CustomMenuBar extends StatelessWidget {
  final User currentUser;

  const CustomMenuBar({super.key, required this.currentUser});

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
                MaterialPageRoute(builder: (context) => HomePageCustomer(currentUser: currentUser),
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
                MaterialPageRoute(
                  builder: (context) => BookingCostumerPage(currentUser: currentUser), // Passer la valeur de booked selon votre logique
                ),
              );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddServiceForm(currentUser: currentUser,)),
                  );
                },
              ),
            ),
          ),
          IconButton(
            alignment: Alignment.bottomCenter,
            icon: SvgPicture.asset(ImageConstant.imgUserBlack),
            // icon: Icon(Icons.message_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerProfileScreen(currentUser: currentUser,)),
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
