import 'package:flutter/material.dart';
import 'package:test_project/Components/custom_grid.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../models/user.dart';

class BookingCostumerPage extends StatefulWidget {
  final User currentUser;
  const BookingCostumerPage({Key? key, required this.currentUser}) : super(key: key);
  User get user => currentUser;
  @override
  _BookingCostumerPageState createState() => _BookingCostumerPageState();
}

class _BookingCostumerPageState extends State<BookingCostumerPage> {
  bool _isPage1Visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isPage1Visible ? null : () => _togglePages(),
                        child: Text('MyPosts'),
                        style: ElevatedButton.styleFrom(
                          primary: _isPage1Visible ? ColorConstant.gray50 : ColorConstant.indigoA100 ,
                          textStyle: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Poppins'),
                          shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isPage1Visible ? () => _togglePages() : null,
                        child: Text('Page 2'),
                        style: ElevatedButton.styleFrom(
                          primary: _isPage1Visible ? ColorConstant.indigoA100 : ColorConstant.gray50,
                          textStyle: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Poppins'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              _isPage1Visible ? CustomServiceGrid(currentUser: widget.currentUser,) : DisplayPage2(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomMenuBar(currentUser: widget.currentUser,),
          ),
        ],
      ),
    );
  }

  void _togglePages() {
    setState(() {
      _isPage1Visible = !_isPage1Visible;
    });
  }
}

class DisplayPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Page 1',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 16),
          // Add more widgets for Page 1 content
        ],
      ),
    );
  }
}

class DisplayPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Page 2',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          SizedBox(height: 16),
          // Add more widgets for Page 2 content
        ],
      ),
    );
  }
}
