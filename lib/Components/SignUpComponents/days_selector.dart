import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:test_project/Components/SignUpComponents/service_selector.dart';
import 'package:test_project/utils/color_constant.dart';

class Days {
  final int id;
  final String name;

  Days({
    required this.id,
    required this.name,
  });
}

class DaySelector extends StatefulWidget {
  final TextEditingController workDaysController;

  const DaySelector({Key? key, required this.workDaysController}) : super(key: key);


  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  static final List<Days> _days = [
    Days(id: 1, name: "Monday"),
    Days(id: 2, name: "Tuesday"),
    Days(id: 3, name: "Wednesday"),
    Days(id: 4, name: "Thursday"),
    Days(id: 5, name: "Friday"),
    Days(id: 6, name: "Saturday"),
    Days(id: 7, name: "Sunday"),
  ];
  final _items =
      _days.map((days) => MultiSelectItem<Days>(days, days.name)).toList();
  List<Days> _selectedDays = [];

  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
   void initState() {
     _selectedDays = _days.toList();
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      dialogHeight: 300,
      checkColor: ColorConstant.indigoA100,
      items: _items,
      itemsTextStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14),
      title: Text(
        "Select day",
        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
      ),
      selectedColor: ColorConstant.indigoA100,
      selectedItemsTextStyle: TextStyle(
          color: ColorConstant.indigoA100, fontFamily: 'Poppins', fontSize: 14),
      backgroundColor: ColorConstant.gray50,
      decoration: BoxDecoration(
        color: ColorConstant.gray50,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        border: Border.all(
          color: ColorConstant.indigo100,
          width: 2,
        ),
      ),
      buttonIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: ColorConstant.indigo100,
      ),
      buttonText: Text(
        "Select days",
        style: TextStyle(
          color: ColorConstant.indigoA100,
          fontSize: 14,
          fontFamily: 'Poppins',
        ),
      ),
      onConfirm: (results) {
        _selectedDays = results;
        widget.workDaysController.text = _selectedDays
            .map((days) => days.name)
            .join(", ");
      },
    );
  }
}
