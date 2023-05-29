import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';

import '../models/poste.dart';
import '../models/user.dart';
import '../services/get_all_posts_byUserId_service.dart';

class offerPostsList extends StatefulWidget {
  final User currentUser;

  offerPostsList({super.key, required this.currentUser});


  @override
  State<offerPostsList> createState() => _offerPostsListState();
}

class _offerPostsListState extends State<offerPostsList> {

  final GetAllPostsByUserService _postService = GetAllPostsByUserService();
  List<Poste> _posts = [];
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final List<Poste> posts = await _postService.getAllPosts(widget.currentUser);
      setState(() {
        _posts = posts;

      });
    } catch (e) {
      setState(() {
      });
      // Handle error
      print('Failed to fetch posts: $e');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child:

      ListView.builder(
        //   scrollDirection: Axis.vertical,
          itemCount: _posts.length,

          itemBuilder: (context, index) {
            final poste = _posts[index];
            final formattedDate = DateFormat.yMMMd().format(poste.serviceDate);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),

              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Set border radius
                  boxShadow: [
                    BoxShadow(
                      color: ColorConstant.gray50,
                      spreadRadius: 2,
                      blurRadius: 20,
                      offset: Offset(0, 10), // Set box shadow properties
                    ),
                  ],
                ),

                child: Card(

                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(widget.currentUser.fullName!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.black900,
                            )),
                        Text(poste.cleaningType,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black900,
                            )),
                        Text(poste.surface.toString() + '  m2',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black900,
                            )),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            Text(widget.currentUser.region!,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: ColorConstant.black900)),
                          ],
                        ),
                        Text("Contact : " + widget.currentUser.email!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.black900,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),

    );
  }
}


