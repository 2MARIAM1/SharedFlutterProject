import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/signup_page.dart';

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
