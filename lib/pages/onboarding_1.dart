import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/Components/next_round_button.dart';

import 'onboarding_2.dart';

class Onboarding1Page extends StatefulWidget {
  const Onboarding1Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Onboarding1PageState createState() => _Onboarding1PageState();
}

class _Onboarding1PageState extends State<Onboarding1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: GestureDetector(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: constraints.maxHeight * 0.53,
                        child: SvgPicture.asset(
                          'assets/images/Onboarding1.svg',
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.075,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Book appointments easily',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Book a cleaning appointment in just a few taps! With Spotless, you can easily schedule a cleaning for your home or office at a time that works best for you.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF7B6F72),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w200),
                          )),
                      RoundButton(onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Onboarding2Page()),
                        );
                      })
                    ],
                  );
                },
              ),
            )));
  }
}
