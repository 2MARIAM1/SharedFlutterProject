import 'package:flutter/material.dart';

class BuildSelectedRegion extends StatelessWidget {
  final TextEditingController regionDropdownController;

  const BuildSelectedRegion({
    Key? key,
    required this.regionDropdownController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Rabat-Salé-Kénitra',
      'Oriental',
      'Fès-Meknès',
      'Tanger-Tetouan-Al Hoceima',
      'Béni Mellal-Khénifra',
      'Casablanca-Settat',
      'Marrakech-Safi',
      'Drâa-Tafilalet',
      'Souss-Massa',
      'Guelmim-Oued Noun',
      'Laâyoune-Sakia El Hamra',
      'Dakhla-Oued Ed-Dahab'
    ];

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
            regionDropdownController.text = newValue;
          }
        },
      ),
    );
  }
}
