import 'package:flutter/material.dart';

class BuildSelectedType extends StatelessWidget {
  final TextEditingController dropdownController;

  const BuildSelectedType({
    Key? key,
    required this.dropdownController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = ['Cleaner', 'Customer'];
    final String initialValue =
        items.first; // Set the initial value to the first item

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButtonFormField<String>(
        value: initialValue, // Set the initial value
        itemHeight: 50,
        dropdownColor: const Color(0xFFF7F8F8),

        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFFADA4A5)),
        iconSize: 30,
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

/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/signup_page.dart';

class BuildSelectedType extends StatefulWidget {
  const BuildSelectedType({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuildSelectedTypeState createState() => _BuildSelectedTypeState();
}

class _BuildSelectedTypeState extends State<BuildSelectedType> {
  String dropdownValue = 'Cleaner';

  @override
  void initState() {
    super.initState();
    dropdownController = TextEditingController(text: dropdownValue);
  }

  @override
  void dispose() {
    dropdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(14),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        itemHeight: 60,
        dropdownColor: Color(0xFFF7F8F8),
        elevation: 5,
        icon: const Icon(Icons.arrow_drop_down, color: Color(0xFFADA4A5)),
        iconSize: 36,
        isExpanded: true,
        underline: const SizedBox(),
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xFFADA4A5),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15),
        items: <String>['Cleaner', 'Customer']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            dropdownController.text = dropdownValue;
          });
        },
      ),
    );
  }
}

*/
/*Widget buildSelectedType() {
  String? selectedOption;
  final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  return DropdownButton<String>(
    value: selectedOption,
    hint: Text('Select an option'),
    items: options.map((String option) {
      return DropdownMenuItem<String>(
        value: option,
        child: Text(option),
      );
    }).toList(),
    onChanged: (value) {
      selectedOption = value.toString();
      print(selectedOption);
    },
  );
}*/