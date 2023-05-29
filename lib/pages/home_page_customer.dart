
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/Components/offer_posts.dart';

import '../Components/custom_menu.dart';
import '../Components/search_bar.dart';
import '../models/user.dart';
import '../utils/color_constant.dart';
import '../utils/image_constant.dart';

class HomePageCustomer extends StatefulWidget {
  final User currentUser;
  const HomePageCustomer({Key? key, required this.currentUser}) : super(key: key);
  User get user => currentUser;
  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();

}

class _HomePageCustomerState extends State<HomePageCustomer> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children:[ Column(
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
                        child: Text("Hello,",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: ColorConstant.blueGray200),
                      ),),
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
                      top: 75,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Notifications'),
                              content: Container(
                                width: 200.0,
                                height: 200.0,

                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: ColorConstant.gray200, // Replace with your desired background color
                          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                        ),
                        child: SvgPicture.asset(ImageConstant.imgNotif),
                      ),
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
              child: Text('My \nrecent posts',style: TextStyle(

                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorConstant.black90001,
              ),),
            ),
          ),

          offerPostsList(currentUser: widget.currentUser),
          ],
        ),
          Align(
            alignment: Alignment.bottomCenter,
              child: CustomMenuBar(currentUser: widget.currentUser,)),
  ]

    ),
      // bottomNavigationBar: CustomMenuBar(),
    );
  }
}

/*
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        //TOP PART
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                // color: ColorConstant.gray200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: SvgPicture.asset(
                ImageConstant.imgNotif,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/