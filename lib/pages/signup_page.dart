// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/Components/SignUpComponents/choose_region.dart';
import 'package:test_project/pages/loginpage.dart';

import '../Components/SignUpComponents/choose_type.dart';
import '../services/SignUpService.dart';

import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpService signUpService = SignUpService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController cinController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dropdownController = TextEditingController();
  final TextEditingController regionDropdownController = TextEditingController();

  Widget buildFullName() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8F8),
          borderRadius: BorderRadius.circular(14),
        ),
        height: 50,
        child: TextFormField(
          controller: fullNameController,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: Color(0xFFADA4A5),
              ),
              hintText: 'Full Name',
              hintStyle: TextStyle(
                  color: Color(0xFFADA4A5),
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
        ));
  }

  Widget buildCIN() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8F8),
          borderRadius: BorderRadius.circular(14),
        ),
        height: 50,
        child: TextFormField(
          controller: cinController,
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                //  Icons.perm_identity_outlined,
                Icons.credit_card,
                color: Color(0xFFADA4A5),
              ),
              hintText: 'CIN',
              hintStyle: TextStyle(
                  color: Color(0xFFADA4A5),
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
        ));
  }

  Widget buildPhoneNumber() {
    return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color(0xFFF7F8F8),
          borderRadius: BorderRadius.circular(14),
        ),
        height: 50,
        child: TextFormField(
          controller: phoneNumberController, // added controller
          style: const TextStyle(color: Colors.black87),
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                //  Icons.perm_identity_outlined,
                Icons.phone_outlined,
                color: Color(0xFFADA4A5),
              ),
              hintText: 'PhoneNumber',
              hintStyle: TextStyle(
                  color: Color(0xFFADA4A5),
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
        ));
  }

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
        height: 50,
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
        height: 50,
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

  /*Widget buildSignUpButton(BuildContext context) {
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

              backgroundColor: Colors.transparent,

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
                  'Register',
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
              final fullName = fullNameController.text;
              final cin = cinController.text;
              final phoneNumber = phoneNumberController.text;
              final email = emailController.text;
              final password = passwordController.text;
              final registrationType = dropdownController.text;
              final region = regionDropdownController.text;

              final success = await signUpService.signUp(fullName, cin,
                  phoneNumber, email, password,region, registrationType);

              if (success) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );

              } else {
                // ignore: use_build_context_synchronously
                showErrorDialog(
                    context, 'Failed to sign up. Please try again.');
              }
            }),
      ),
    );
  }

   */

  Widget buildSignUpButton(BuildContext context) {
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
            colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
          ),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            backgroundColor: Colors.transparent,
          ),
          onPressed: () async {
            final fullName = fullNameController.text;
            final cin = cinController.text;
            final phoneNumber = phoneNumberController.text;
            final email = emailController.text;
            final password = passwordController.text;
            final registrationType = dropdownController.text;
            final region = regionDropdownController.text;

            final success = await signUpService.signUp(
              fullName,
              cin,
              phoneNumber,
              email,
              password,
              region,
              registrationType,
            );

            if (success) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else {
              showErrorDialog(
                context,
                'Failed to sign up. Please try again.',
              );
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.login,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogInBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: "Already have an account ? ",
              style: TextStyle(
                  color: Color(0xFFADA4A5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins')),
          TextSpan(
              text: "Log In",
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

  @override
  void dispose() {
    dropdownController.dispose();
    regionDropdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
           Padding(
              
              padding: const EdgeInsets.symmetric(
                  horizontal: 25, vertical: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Hey there,',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    const Text(
                      'Create your account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                        height:
                            MediaQuery.of(context).size.height * 0.05),
                    buildFullName(),
                    SizedBox(height: 10),
                    buildCIN(),
                    SizedBox(height: 10),
                    buildPhoneNumber(),
                    SizedBox(height: 10),
                    BuildSelectedType(
                        dropdownController: dropdownController),
                    SizedBox(height: 10),
                    BuildSelectedRegion(
                        regionDropdownController: regionDropdownController,),
                    SizedBox(height: 10),
                    buildEmail(),
                    const SizedBox(height: 10),
                    buildPassword(),
                    const SizedBox(height: 40),
                    buildSignUpButton(context),
                    const SizedBox(height: 10),
                    buildLogInBtn(context),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
