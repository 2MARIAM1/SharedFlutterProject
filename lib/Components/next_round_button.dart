import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RoundButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: const EdgeInsets.all(16),
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)]),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.keyboard_arrow_right_outlined),
            color: Colors.white,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
