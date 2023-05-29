import 'package:flutter/material.dart';

import '../../utils/color_constant.dart';

class BuildCustomSelector extends StatelessWidget {
  final TextEditingController dropdownController;
  final List<String> items;

  const BuildCustomSelector({
    Key? key,
    required this.dropdownController,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String initialValue = items.first; // Set the initial value to the first item

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstant.indigo100.withOpacity(0.5),
          width: 1,
        ),
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(40),
      ),
      child: DropdownButtonFormField<String>(
        value: initialValue, // Set the initial value
        itemHeight: 50,
        dropdownColor: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(40),
        focusColor: Colors.transparent,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: ColorConstant.gray500,
        ),

        isExpanded: true,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: ColorConstant.indigoA100),
        alignment: Alignment.center,

        decoration: const InputDecoration(
          border: InputBorder.none,

          // Remove default border line
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),

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
