import 'package:flutter/material.dart';
import 'package:test_project/utils/color_constant.dart';

class EquipmentSelection extends StatefulWidget {
  final ValueChanged<bool> onEquipmentChanged;

  const EquipmentSelection({Key? key, required this.onEquipmentChanged}) : super(key: key);

  @override
  _EquipmentSelectionState createState() => _EquipmentSelectionState();
}

class _EquipmentSelectionState extends State<EquipmentSelection> {
  bool isEquipmentSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstant.gray50,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: ColorConstant.indigo100,
          width: 2,
        ),
      ),
      child: SwitchListTile(
        title: isEquipmentSelected
            ? Text(
                'On',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: ColorConstant.indigoA100,
                ),
              )
            : Text(
                'Off',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: ColorConstant.indigoA100,
                ),
              ),

        activeColor: ColorConstant.indigoA100,
        activeTrackColor: ColorConstant.indigo50,
        inactiveThumbColor: ColorConstant.gray50,
        inactiveTrackColor: ColorConstant.gray200,

        value: isEquipmentSelected,
        onChanged: (newValue) {
          setState(() {
            isEquipmentSelected = newValue;
            widget.onEquipmentChanged(isEquipmentSelected);

          });
        },
      ),
    );
  }
}
