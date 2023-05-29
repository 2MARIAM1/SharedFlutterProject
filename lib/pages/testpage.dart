/*
* import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';


  Widget offerPostsList(BuildContext context) {
    return Expanded(
            child:

        ListView.builder(
            //   scrollDirection: Axis.vertical,
            itemCount: 2,

            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),

                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.gray50.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 22,
                        offset: Offset(0, 10), // Set box shadow properties
                      ),
                    ],
                  ),

                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Set border radius
              ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sofia Vergara',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.black900,
                            )),
                        Text('Professional cleaner',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black900,
                            )),
                        Row(
                          //ROW OF STARS
                          children: [
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: SvgPicture.asset(
                                ImageConstant.imgStar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: SvgPicture.asset(
                                ImageConstant.imgStar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: SvgPicture.asset(
                                ImageConstant.imgStar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: SvgPicture.asset(
                                ImageConstant.imgStar,
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: SvgPicture.asset(
                                ImageConstant.imgStarGrey,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('150 reviews',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.blueGray200,
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(
                                child: Row(
                                  children: [

                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                        color: ColorConstant.gray50,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: SvgPicture.asset(
                                        ImageConstant.imgMappin,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width *
                                            0.01),
                                    Text("Rabat-Salé-Kénitra",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: ColorConstant.black900)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),

    );
  }

*/