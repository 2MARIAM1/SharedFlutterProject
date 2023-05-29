import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/Components/custom_selector.dart';
import 'package:test_project/Components/date_picker.dart';
import 'package:test_project/pages/booking_page_customer.dart';
import 'package:test_project/pages/testpage.dart';
import 'package:test_project/services/add_service_post_service.dart';
import 'dart:convert';

import '../Components/SignUpComponents/choose_region.dart';
import '../Components/custom_button.dart';
import '../Components/custom_menu.dart';
import '../models/user.dart';
import '../utils/color_constant.dart';

class AddServiceForm extends StatefulWidget {

  final User currentUser;
  const AddServiceForm({Key? key, required this.currentUser}) : super(key: key);
  User get user => currentUser;

  @override
  _AddServiceFormState createState() => _AddServiceFormState();
}
final AddServicePost addServicePost = AddServicePost();
final TextEditingController serviceTypeController = TextEditingController();
final TextEditingController regionDropdownController = TextEditingController();
final TextEditingController surfaceController = TextEditingController();
final TextEditingController estimatedPriceController = TextEditingController();
final TextEditingController dateController = TextEditingController();

final List<String> serviceTypeItems = [
  "Regular Cleaning",
  "Deep Cleaning",
  "Carpet Cleaning",
  "Specialized Cleaning",
];
final List<String> regionItems = [
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



Widget buildNumberFeild(TextEditingController feildController, String hintText,String suffixText) {
  return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: ColorConstant.indigo100.withOpacity(0.5),
          width: 1,
        ),

        //     boxShadow: const [
        //     BoxShadow(color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
        // ]
      ),
      height: 50,
      child: TextField(
        controller: feildController,
        keyboardType: TextInputType.number,

        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
            suffixText: suffixText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText,
            hintStyle: TextStyle(
              color: ColorConstant.indigoA100,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            )),
      ));
}


class _AddServiceFormState extends State<AddServiceForm> {

  void OnPressedHandler()async{

    String cleaningType = serviceTypeController.text;
    String location = regionDropdownController.text ;
    int surface= int.parse(surfaceController.text) ;
    int estimatedPrice = int.parse(estimatedPriceController.text) ;
    DateTime serviceDate = DateTime.parse(dateController.text);

    bool booked = false; // Set the booked status as needed
    User user = widget.currentUser;


    bool success = await addServicePost.addPost(
      cleaningType,
      location,
      estimatedPrice,
      surface,
      serviceDate,
      booked,
      user,
    );

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookingCostumerPage(currentUser: widget.currentUser)),
      );
    } else {
      print("error posting");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Add service post',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: ColorConstant.indigoA100,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                         children: <Widget>[

                           Container(
                             padding: const EdgeInsets.all(5),
                             alignment: Alignment.centerLeft,
                             child: const Text(
                               'Select the requested cleaning service ',
                               style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                             ),
                           ),
                           BuildCustomSelector(dropdownController: serviceTypeController, items: serviceTypeItems),
                           SizedBox(height: 20,),
                           Container(
                             padding: const EdgeInsets.all(5),
                             alignment: Alignment.centerLeft,
                             child: const Text(
                               'Select region  ',
                               style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                             ),
                           ),
                           BuildCustomSelector(dropdownController: regionDropdownController,items: regionItems),
                           const SizedBox(height: 20),
                           Container(
                             padding: const EdgeInsets.all(5),
                             alignment: Alignment.centerLeft,
                             child: const Text(
                               'Enter the surface of our property or cleaning area',
                               style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                             ),
                           ),
                           buildNumberFeild(surfaceController, "Enter Surface","m2"),
                           const SizedBox(height: 20),
                           Container(
                             padding: const EdgeInsets.all(5),
                             alignment: Alignment.centerLeft,
                             child: const Text(
                               'Enter estimated price for the service',
                               style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                             ),
                           ),
                           buildNumberFeild(estimatedPriceController, "Enter Price","MAD"),
                           const SizedBox(height: 20),
                           Container(
                             padding: const EdgeInsets.all(5),
                             alignment: Alignment.centerLeft,
                             child: const Text(
                               'Select the date of the requested service ',
                               style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                             ),
                           ),
                           DatePickerExample(dateController: dateController),
                           SizedBox(height: 30,),
                           buildCustomButton(context,'Post',OnPressedHandler),
                         ],
                    ),
                  ),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomMenuBar(currentUser: widget.currentUser),
          ),
        ],
      ),
    );
  }
}