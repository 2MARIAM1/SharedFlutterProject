import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/Components/next_round_button.dart';
import 'package:test_project/pages/loginpage.dart';

class Onboarding3Page extends StatefulWidget {
  const Onboarding3Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Onboarding3PageState createState() => _Onboarding3PageState();
}

class _Onboarding3PageState extends State<Onboarding3Page> {
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
                  'assets/images/Onboarding3.svg',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.075,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Enjoy a clean home',
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
                    'Experience the joy of a clean home without the hassle! With Spotless, you can sit back, relax, and enjoy your sparkling clean space, knowing that our skilled cleaners have taken care of everything for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF7B6F72),
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  )),
              RoundButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              })
            ],
          );
        },
      ),
    );
  }
}
