import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/Components/next_round_button.dart';

import 'onboarding_3.dart';

class Onboarding2Page extends StatefulWidget {
  const Onboarding2Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Onboarding2PageState createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: constraints.maxHeight * 0.5,
                child: SvgPicture.asset(
                  'assets/images/Onboarding2.svg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Find the perfect job',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Find the perfect cleaning job with Spotless! Our app matches you with clients in your area who need your skills and expertise. You\'ll never have to worry about finding work again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF7B6F72),
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  )),
              RoundButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Onboarding3Page()),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
