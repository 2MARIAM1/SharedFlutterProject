import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/utils/color_constant.dart';

import '../utils/image_constant.dart';

final TextEditingController _searchController = TextEditingController();

Widget buildSearchBar() {
  return
     Container(
      margin: EdgeInsets.only(top:5),
      height: 38,
      width: 335,
      decoration: BoxDecoration(
        color: ColorConstant.gray50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(ImageConstant.imgSearch) ,
            onPressed: () {
              // Perform the search here
            },
          ),
          Expanded(
            child: TextField(

              controller: _searchController,
              decoration: InputDecoration(

                hintText: 'Search...',
                hintStyle: TextStyle(
                    color: ColorConstant.black9003f,
                    fontFamily: 'Poppins',
                    fontSize: 14),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
  );
}
