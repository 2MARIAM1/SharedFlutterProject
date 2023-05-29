import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:test_project/services/get_allPosts_service.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';
import 'package:http/http.dart' as http;

import '../models/poste.dart';
import '../models/user.dart';
import '../pages/booking_page_cleaner.dart';
import '../services/get_all_posts_byUserId_service.dart';

class BookedPostsListCleaner extends StatefulWidget {
  final User currentUser;

  BookedPostsListCleaner({super.key, required this.currentUser});

  @override
  State<BookedPostsListCleaner> createState() => _BookedPostsListCleanerState();
}

class _BookedPostsListCleanerState extends State<BookedPostsListCleaner> {
  final GetAllPostsService _postService = GetAllPostsService();
  List<Poste> _posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final List<Poste> allPosts = await _postService.getAllPosts();
      final List<Poste> bookedPosts = allPosts.where((poste) => poste.booked == true).toList();
      setState(() {
        _posts = bookedPosts;
      });
    } catch (e) {
      setState(() {});
      // Handle error
      print('Failed to fetch posts: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final poste = _posts[index];
          final formattedDate = DateFormat.yMMMd().format(poste.serviceDate);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorConstant.gray50,
                    spreadRadius: 2,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            poste.user.fullName!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: ColorConstant.black900,
                            ),
                          ),
                          Text(
                            poste.cleaningType,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black900,
                            ),
                          ),
                          Text(
                            poste.surface.toString() + '  m2',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstant.black900,
                            ),
                          ),
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
                                width:
                                MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                "Rabat-Salé-Kénitra",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.black900,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Contact : " + poste.user.phoneNumber!,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstant.black900,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
