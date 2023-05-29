import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:test_project/services/book_service.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';
import 'package:http/http.dart' as http;

import '../models/poste.dart';
import '../models/user.dart';
import '../pages/booking_page_cleaner.dart';
import '../services/get_allPosts_service.dart';
import '../services/get_all_posts_byUserId_service.dart';

class OfferPostsListCleaner extends StatefulWidget {
  final User currentUser;

  OfferPostsListCleaner({Key? key, required this.currentUser});

  @override
  State<OfferPostsListCleaner> createState() => _OfferPostsListCleanerState();
}

class _OfferPostsListCleanerState extends State<OfferPostsListCleaner> {
  final GetAllPostsService _postService = GetAllPostsService();
  List<Poste> _posts = [];
  List<Poste> _postsnearme = [];
  final BookService _bookService = BookService();

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final List<Poste> posts = await _postService.getAllPosts();
      final List<Poste> postsNearMe = posts.where((poste) => poste.location == widget.currentUser.region).toList();
      setState(() {

        _posts = posts;
        _postsnearme = postsNearMe;

      });

    } catch (e) {
      setState(() {});
      // Handle error
      print('Failed to fetch posts: $e');
    }
  }

  Future<void> bookPoste(Poste poste) async {
    try {
      final bool success = await _bookService.Book(
        poste.cleaningType,
        poste.location,
        poste.estimatedPrice,
        poste.surface,
        poste.serviceDate,
        true,
        poste.user,
      );

      if (success) {
        print('Poste booked successfully');
      } else {
        print('Failed to book poste');
      }
    } catch (e) {
      print('Failed to book poste: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _postsnearme.length,
        itemBuilder: (context, index) {
          final poste = _postsnearme[index];
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
                          Text(
                            formattedDate,
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
                                poste.location,
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary:
                          ColorConstant.lightblue20, // Background color
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600), // Text style
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10), // Button padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30), // Button border radius
                          ),
                        ),
                        child: Text('Book'),
                        onPressed: poste.booked
                            ? null
                            : () async {
                          await bookPoste(poste);
                          if (poste.booked) {
                            // Remove the booked post from the list
                            setState(() {
                              _postsnearme.remove(poste);
                              _posts.remove(poste);
                            });

                            // Navigate to the MyBookings page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyBookingsCleanerPage(
                                      currentUser: widget.currentUser,
                                    ),
                              ),
                            );
                          }
                        },
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
