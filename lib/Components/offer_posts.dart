import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';

class OfferPostsList extends StatefulWidget {
  const OfferPostsList({super.key});

  @override
  State<OfferPostsList> createState() => _OfferPostsListState();
}

class _OfferPostsListState extends State<OfferPostsList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          //   scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              ImageConstant.imgRectangle21,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
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
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10 years of experience",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: ColorConstant.blueGray200),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04),
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.gray500,
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
            );
          }),
    ]);
  }
}
