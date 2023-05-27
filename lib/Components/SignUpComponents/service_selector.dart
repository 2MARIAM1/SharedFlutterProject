import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:test_project/Components/SignUpComponents/service_selector.dart';
import 'package:test_project/utils/color_constant.dart';

class ServiceType {
  final int id;
  final String name;

  ServiceType({
    required this.id,
    required this.name,
  });
}

class ServiceTypeSelector extends StatefulWidget {
  const ServiceTypeSelector({Key? key}) : super(key: key);

  @override
  State<ServiceTypeSelector> createState() => _ServiceTypeSelectorState();
}

class _ServiceTypeSelectorState extends State<ServiceTypeSelector> {
  static final List<ServiceType> _serviceTypes = [
    ServiceType(id: 1, name: "Regular Cleaning"),
    ServiceType(id: 2, name: "Deep Cleaning"),
    ServiceType(id: 3, name: "Carpet Cleaning"),
    ServiceType(id: 4, name: "Specialized Cleaning"),
  ];
  final _items = _serviceTypes
      .map((serviceType) =>
          MultiSelectItem<ServiceType>(serviceType, serviceType.name))
      .toList();
  List<ServiceType> _selectedServiceTypes = [];

  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedServiceTypes = _serviceTypes.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      checkColor: ColorConstant.indigoA100,
      items: _items,
      title: Text(
        "Select service",
        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
      ),
      selectedColor: ColorConstant.indigoA100,
      separateSelectedItems: true,
      selectedItemsTextStyle: TextStyle(color: Colors.indigo[700]),
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
        "Select service",
        style: TextStyle(
          color: ColorConstant.indigoA100,
          fontSize: 16,
          fontFamily: 'Poppins',
        ),
      ),
      onConfirm: (results) {
        _selectedServiceTypes = results;
      },
    );
  }
}
