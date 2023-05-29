import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/poste.dart';
import '../models/user.dart';
import '../services/get_all_posts_byUserId_service.dart';
import 'custom_menu.dart';

import '../utils/color_constant.dart';

class CustomServiceGrid extends StatefulWidget {
  final User currentUser;

  CustomServiceGrid({super.key, required this.currentUser});

  @override
  State<CustomServiceGrid> createState() => _CustomServiceGridState();
}

class _CustomServiceGridState extends State<CustomServiceGrid> {
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
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 1.0,
        ),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final poste = _posts[index];
          final formattedDate = DateFormat.yMMMd().format(poste.serviceDate);
          return Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    poste.cleaningType,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: ColorConstant.indigoA100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    poste.surface.toString() + '  m2',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: ColorConstant.gray500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(height: 8.0),
                  Text(
                    formattedDate.toString(),
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: ColorConstant.gray500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    poste.estimatedPrice.toString() + '  MAD',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: ColorConstant.gray500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),


                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      poste.booked ? 'Accepté' : 'en attente....',
                      style: TextStyle(
                        color: poste.booked ? Colors.green : Colors.red,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


