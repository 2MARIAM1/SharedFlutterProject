import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';

class BuildSelectedExperience extends StatelessWidget {
  final TextEditingController dropdownController;

  const BuildSelectedExperience({
    Key? key,
    required this.dropdownController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Professional , 5+ Years of experience',
      'Intermediate , 2 to 5 years of experience',
      'Begginer , Less than 2 years of experience'
    ];
    final String initialValue =
        items.first; // Set the initial value to the first item

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: DropdownButtonFormField<String>(
        value: initialValue, // Set the initial value
        itemHeight: 50,
        dropdownColor: const Color(0xFFF7F8F8),

        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: ColorConstant.indigo100,
        ),
        isExpanded: true,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFFADA4A5),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 15),
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            dropdownController.text = newValue;
          }
        },
      ),
    );
  }
}
