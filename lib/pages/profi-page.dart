import 'package:flutter/material.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../utils/image_constant.dart';
import 'loginpage.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'Sofia';
  String email = 'utilisateur@example.com';

  void _logout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    // Action à effectuer lorsque le bouton de déconnexion est pressé
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Stack(children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset(
                        ImageConstant.imgRectangle21,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      username,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: ColorConstant.indigoA100,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text('sofiaverg')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text('sofiaverg@gmail.com')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Colonne 1',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Colonne 2',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Action à effectuer lorsque le nouveau bouton est pressé
                    },
                    child: Text('Nouveau bouton'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nouveau texte',
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: _logout,
                    child: Text('Déconnexion'),
                  ),
                ],
              ),
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: CustomMenuBar()),
        ]));
  }
}
