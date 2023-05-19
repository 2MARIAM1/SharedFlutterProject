import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/color_constant.dart';
import '../utils/image_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30),
            child: Row(
              //TOP PART
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Welcome,",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: ColorConstant.blueGray200,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text("Sofia",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: ColorConstant.black900,
                          )),
                    ),
                  ],
                ),
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
          ),
          //SearchBar(),
        ],
      ),
    );
  }
}
