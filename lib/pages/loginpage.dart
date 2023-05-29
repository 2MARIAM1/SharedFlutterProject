import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/main.dart';
import 'package:test_project/pages/add_infos_cleaner.dart';
import 'package:test_project/pages/cleaner_home_page.dart';

import '../models/user.dart';
import '../services/auth_service.dart';
import 'home_page_customer.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

final AuthService authService = AuthService();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

Widget buildEmail() {
  return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(14),

        //     boxShadow: const [
        //     BoxShadow(color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
        // ]
      ),
      height: 60,
      child: TextField(
        controller: emailController, // added controller
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black87),
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Color(0xFFADA4A5),
            ),
            hintText: 'Email',
            hintStyle: TextStyle(
                color: Color(0xFFADA4A5),
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w500)),
      ));
}

Widget buildPassword() {
  return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(14),
      ),
      height: 60,
      child: TextField(
        controller: passwordController, // added controller
        obscureText: true,
        style: const TextStyle(color: Colors.black87),
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(
              Icons.lock_open_rounded,
              color: Color(0xFFADA4A5),
            ),
            hintText: 'Password',
            hintStyle: TextStyle(
                color: Color(0xFFADA4A5),
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w500)),
      ));
}

void showErrorDialog(BuildContext context, String s) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('Invalid email or password.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget buildLoginButton(BuildContext context) {
  return Material(
    elevation: 5,
    shadowColor: Colors.blue.withOpacity(0.45),
    borderRadius: BorderRadius.circular(99),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)])),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.login,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
          onPressed: () async {
            final email = emailController.text;
            final password = passwordController.text;

            final User? user = await authService.authenticate(email, password);

            if (user != null) {
              if (user.registration_type == 'Cleaner') {
                if(user.availability != null && user.description != null && user.equipment != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CleanerHomePage(currentUser: user),
                    ),
                  );
              }
                else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddInfosCleanerPage(currentUser: user),
                    ),
                  );

                }
              } else if (user.registration_type == 'Customer') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageCustomer(currentUser: user,)),
                );
              }
            } else {
              showErrorDialog(context, 'Invalid email or password.');
            }
          }
      ),
    ),
  );
}

Widget buildSignUpBtn(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    },
    child: RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: "Don't have an account ? ",
            style: TextStyle(
                color: Color(0xFFADA4A5),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins')),
        TextSpan(
            text: "Sign Up",
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2,
                color: Color(0xFFADA4A5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'))
      ]),
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 30, left: 20),
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    width: 120,
                    height: 20,
                  ),
                ),
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 80),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                          const Text(
                            'Sign In to your Spotless account !',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 40),
                            child: SvgPicture.asset(
                              'assets/images/LoginImage.svg',
                            ),
                          ),
                          buildEmail(),
                          const SizedBox(height: 20),
                          buildPassword(),
                          const SizedBox(height: 60),
                          buildLoginButton(context),
                          const SizedBox(height: 10),
                          buildSignUpBtn(context),
                        ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

/*onPressed: () async {
          final email = emailController.text;
          final password = passwordController.text;

          final registration_type =
              await authService.authenticate(email, password);

          if (registration_type != null) {
            if (registration_type == 'Cleaner') {
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CleanerHomePage()),
              );
            } else if (registration_type == 'Customer') {
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          } else {
            // Show error message for failed authentication
            // ignore: use_build_context_synchronously
            showErrorDialog(context, 'Invalid email or password.');
          }
        },*/
