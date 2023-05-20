
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CleanerHomePage extends StatefulWidget {
  const CleanerHomePage({Key? key}) : super(key: key);

  @override
  State<CleanerHomePage> createState() => _CleanerHomePageState();
}

class _CleanerHomePageState extends State<CleanerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("CLEANER HOME PAGE"),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_decoration.dart';
import '../utils/app_style.dart';
import '../utils/color_constant.dart';
import '../utils/image_constant.dart';
import '../utils/size_utils.dart';
import '../widgets/app_bar/appbar_image.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            80,
          ),
          title: Padding(
            padding: getPadding(
              left: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      right: 13,
                    ),
                    child: Text(
                      "Welcome ,",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsRegular12,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: getPadding(
                      left: 20,
                      top: 3,
                    ),
                    child: Text(
                      "Sofia ",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsBold20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              height: getSize(
                30,
              ),
              width: getSize(
                30,
              ),
              margin: getMargin(
                left: 26,
                top: 10,
                right: 26,
                bottom: 9,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppbarImage(
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                    svgPath: ImageConstant.imgUserGray300,
                  ),
                  AppbarImage(
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    svgPath: ImageConstant.imgVolume,
                    margin: getMargin(
                      all: 6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 34,
            top: 33,
            right: 34,
            bottom: 33,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: getMargin(
                    left: 13,
                    right: 12,
                  ),
                  padding: getPadding(
                    left: 12,
                    top: 9,
                    right: 12,
                    bottom: 9,
                  ),
                  decoration: AppDecoration.fillBluegray20067.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                        height: getSize(
                          16,
                        ),
                        width: getSize(
                          16,
                        ),
                        margin: getMargin(
                          top: 1,
                          bottom: 1,
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 84,
                          right: 168,
                          bottom: 1,
                        ),
                        child: Text(
                          "Search",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtEncodeSansRegular14.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 6,
                  top: 18,
                  right: 19,
                ),
                child: Row(
                  children: [
                    Container(
                      width: getHorizontalSize(
                        91,
                      ),
                      padding: getPadding(
                        left: 8,
                        top: 2,
                        right: 8,
                        bottom: 2,
                      ),
                      decoration:
                          AppDecoration.gradientIndigoA100Blue200.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6,
                      ),
                      child: Row(
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgCalendarBlack900,
                            height: getSize(
                              24,
                            ),
                            width: getSize(
                              24,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 8,
                              top: 4,
                              bottom: 1,
                            ),
                            child: Text(
                              "9 Sep",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtEncodeSansSmBold14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        125,
                      ),
                      margin: getMargin(
                        left: 14,
                      ),
                      padding: getPadding(
                        left: 11,
                        top: 4,
                        right: 11,
                        bottom: 4,
                      ),
                      decoration:
                          AppDecoration.txtGradientIndigoA100Blue200.copyWith(
                        borderRadius: BorderRadiusStyle.txtRoundedBorder8,
                      ),
                      child: Text(
                        "House Cleaning",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtEncodeSansSmBold14Black900,
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(
                        91,
                      ),
                      margin: getMargin(
                        left: 14,
                      ),
                      padding: getPadding(
                        left: 12,
                        top: 4,
                        right: 12,
                        bottom: 4,
                      ),
                      decoration: AppDecoration.fillBluegray50.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgSettings,
                            height: getSize(
                              16,
                            ),
                            width: getSize(
                              16,
                            ),
                            margin: getMargin(
                              top: 1,
                              bottom: 1,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 12,
                              bottom: 1,
                            ),
                            child: Text(
                              "Filter",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtEncodeSansSmBold14Black90001,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Container(
                  width: getHorizontalSize(
                    359,
                  ),
                  margin: getMargin(
                    top: 39,
                    bottom: 392,
                  ),
                  padding: getPadding(
                    left: 16,
                    top: 9,
                    right: 16,
                    bottom: 9,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 7,
                          right: 77,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: EdgeInsets.all(0),
                              color: ColorConstant.blueGray200,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyle.roundedBorder16,
                              ),
                              child: Container(
                                height: getSize(
                                  72,
                                ),
                                width: getSize(
                                  72,
                                ),
                                decoration:
                                    AppDecoration.fillBluegray200.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder16,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgUserWhiteA700,
                                      height: getVerticalSize(
                                        33,
                                      ),
                                      width: getHorizontalSize(
                                        35,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgRectangle21,
                                      height: getSize(
                                        72,
                                      ),
                                      width: getSize(
                                        72,
                                      ),
                                      radius: BorderRadius.circular(
                                        getHorizontalSize(
                                          18,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 20,
                                bottom: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Vasilenko Oksana",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtEncodeSansBold18.copyWith(
                                      letterSpacing: getHorizontalSize(
                                        0.36,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Professional cleaner",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .txtEncodeSansSmBold14Black90001,
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: getHorizontalSize(
                                            68,
                                          ),
                                          margin: getMargin(
                                            top: 1,
                                          ),
                                          child: Row(
                                            children: [
                                              CustomImageView(
                                                svgPath: ImageConstant.imgStar,
                                                height: getSize(
                                                  12,
                                                ),
                                                width: getSize(
                                                  12,
                                                ),
                                              ),
                                              CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgStar12x12,
                                                height: getSize(
                                                  12,
                                                ),
                                                width: getSize(
                                                  12,
                                                ),
                                                margin: getMargin(
                                                  left: 2,
                                                ),
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgStar1,
                                                height: getSize(
                                                  12,
                                                ),
                                                width: getSize(
                                                  12,
                                                ),
                                                margin: getMargin(
                                                  left: 2,
                                                ),
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgStar2,
                                                height: getSize(
                                                  12,
                                                ),
                                                width: getSize(
                                                  12,
                                                ),
                                                margin: getMargin(
                                                  left: 2,
                                                ),
                                              ),
                                              Container(
                                                height: getSize(
                                                  12,
                                                ),
                                                width: getSize(
                                                  12,
                                                ),
                                                margin: getMargin(
                                                  left: 2,
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.topLeft,
                                                  children: [
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgStar3,
                                                      height: getSize(
                                                        12,
                                                      ),
                                                      width: getSize(
                                                        12,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                    CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSubtract,
                                                      height: getVerticalSize(
                                                        10,
                                                      ),
                                                      width: getHorizontalSize(
                                                        5,
                                                      ),
                                                      alignment:
                                                          Alignment.topLeft,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 11,
                                          ),
                                          child: Text(
                                            "125 Reviews",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtEncodeSansMd11
                                                .copyWith(
                                              letterSpacing: getHorizontalSize(
                                                0.4,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 7,
                          right: 57,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 1,
                                bottom: 4,
                              ),
                              child: Text(
                                "10 ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style:
                                    AppStyle.txtEncodeSansSmBold14Bluegray200,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 3,
                                top: 5,
                                bottom: 4,
                              ),
                              child: Text(
                                "years of experience",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtEncodeSansMd11.copyWith(
                                  letterSpacing: getHorizontalSize(
                                    0.4,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(
                                64,
                              ),
                              margin: getMargin(
                                left: 17,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomIconButton(
                                    height: 24,
                                    width: 24,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgMappin,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 8,
                                      top: 4,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "1.5 km",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtEncodeSansMd11Black90001
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(
                                52,
                              ),
                              margin: getMargin(
                                left: 13,
                              ),
                              child: Row(
                                children: [
                                  CustomIconButton(
                                    height: 24,
                                    width: 24,
                                    child: CustomImageView(
                                      svgPath: ImageConstant.imgWallet,
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      left: 8,
                                      top: 4,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      "20",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle
                                          .txtEncodeSansMd11Black90001
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.4,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/