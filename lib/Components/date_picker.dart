import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/utils/color_constant.dart';
import 'package:test_project/utils/image_constant.dart';
import 'package:intl/intl.dart';

class DatePickerExample extends StatefulWidget {
  final TextEditingController dateController;

  const DatePickerExample({
    Key? key,
    required this.dateController,
  }) : super(key: key);

  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    widget.dateController.text = _formatDate(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: ColorConstant.indigo100.withOpacity(0.5),
          width: 1,
        ),
      ),
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: widget.dateController,
        keyboardType: TextInputType.number,
        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Select date',
          hintStyle: TextStyle(
            color: ColorConstant.indigoA100,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          suffixIcon: IconButton(
            onPressed: () => _selectDate(context),
            icon: SvgPicture.asset(
              ImageConstant.imgCalendar,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        widget.dateController.text = _formatDate(selectedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
