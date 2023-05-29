import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/Components/offer_posts_cleaner.dart';

import '../Components/custom_menu_cleaner.dart';
import '../models/user.dart';
import '../utils/color_constant.dart';
import '../utils/image_constant.dart';

class CleanerHomePage extends StatefulWidget {
  final User currentUser;
  const CleanerHomePage({Key? key, required this.currentUser})
      : super(key: key);
  User get user => currentUser;
  @override
  State<CleanerHomePage> createState() => _CleanerHomePageState();
}

class _CleanerHomePageState extends State<CleanerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 45),
                        child: Text(
                          "Hello,",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: ColorConstant.blueGray200),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 5),
                        child: Text(widget.currentUser.fullName!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.black900,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.height * 0.02,
                        top: 75),
                    child: Container(
                      margin: const EdgeInsets.all(6),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: ColorConstant
                            .gray200, // Replace with your desired background color
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                      child: SvgPicture.asset(ImageConstant.imgNotif),
                      //   Icon(
                      //    Icons
                      //        .notifications_none_outlined, // Replace with your desired icon
                      //    color: ColorConstant
                      //        .black900, // Replace with your desired icon color
                      //    size: 24.0, // Replace with your desired icon size
                      //  ),
                    ),
                  )
                ]),
            const SizedBox(
              height: 50,
            ),
            // buildSearchBar(),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Service requests \nnear me',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorConstant.black90001,
                  ),
                ),
              ),
            ),

            OfferPostsListCleaner(currentUser: widget.currentUser),
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: CustomMenuBarCleaner(
              currentUser: widget.currentUser,
            )),
      ]),
      // bottomNavigationBar: CustomMenuBar(),
    );
  }
}
