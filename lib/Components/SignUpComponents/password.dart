import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/signup_page.dart';

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
