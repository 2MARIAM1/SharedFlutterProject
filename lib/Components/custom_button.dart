import 'package:flutter/material.dart';

Widget buildCustomButton(BuildContext context, String buttonText,VoidCallback onPressed) {
  return Material(
    elevation: 5,
    shadowColor: Colors.blue.withOpacity(0.45),
    borderRadius: BorderRadius.circular(99),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),

        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
