
import 'package:flutter/material.dart';
import 'package:test_project/Components/SignUpComponents/days_selector.dart';
import 'package:test_project/Components/SignUpComponents/equipment_switch.dart';
import 'package:test_project/Components/SignUpComponents/experience_selector.dart';
import 'package:test_project/Components/SignUpComponents/service_selector.dart';
import 'package:test_project/Components/custom_button.dart';
import 'package:test_project/pages/cleaner_home_page.dart';
import 'package:test_project/utils/color_constant.dart';

import '../models/user.dart';
import '../services/add_infos_cleaner_service.dart';

class AddInfosCleanerPage extends StatefulWidget {
  final User currentUser;


   const AddInfosCleanerPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<AddInfosCleanerPage> createState() => _AddInfosCleanerPageState();
}

Widget buildProfileDescriptionField(
    TextEditingController profileDescController) {
  return TextFormField(
    controller: profileDescController,
    maxLines: 10,
    decoration: InputDecoration(
      labelText: 'Profile Description',
      filled: true,
      fillColor: ColorConstant.gray50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      labelStyle: TextStyle(
        color: ColorConstant.indigoA100,
        fontSize: 14,
        fontFamily: 'Poppins',
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontFamily: 'Poppins',
      ),
    ),
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14,
      color: ColorConstant.indigoA100,
    ),
  );
}

Widget buildAvailability(TextEditingController availabilityController) {
  return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F8),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: ColorConstant.indigo100,
          width: 2,
        ),

        //     boxShadow: const [
        //     BoxShadow(color: Colors.black, blurRadius: 6, offset: Offset(0, 2))
        // ]
      ),
      height: 50,
      child: TextField(
        controller: availabilityController,
        keyboardType: TextInputType.number,

        style: TextStyle(color: Colors.black87),
        decoration: InputDecoration(
            suffixText: 'hr/week',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Enter number of hours',
            hintStyle: TextStyle(
              color: ColorConstant.indigoA100,
              fontFamily: 'Poppins',
              fontSize: 14,
            )),
      ));
}

class _AddInfosCleanerPageState extends State<AddInfosCleanerPage> {
  final TextEditingController experienceDropdownController = TextEditingController();
  final TextEditingController profileDescController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();
  final TextEditingController serviceTypeController = TextEditingController();
  final TextEditingController daySelectorController = TextEditingController();
  final ValueNotifier<bool> equipmentSelectionController = ValueNotifier<bool>(false);
  final AddInfosCleanerService addInfosService = AddInfosCleanerService();

  void onPressedHandler()async{

    String experience = experienceDropdownController.text;
    int availability = int.parse(availabilityController.text);
    List<String> workdays = daySelectorController.text.split(',');
    List<String> cleaning_types = serviceTypeController.text.split(',');
    bool equipment = equipmentSelectionController.value;
    String description = profileDescController.text;

    bool success = await addInfosService.addInfos(
      widget.currentUser.id!,
      widget.currentUser.fullName!,
      widget.currentUser.cin!,
      widget.currentUser.phoneNumber!,
      widget.currentUser.email!,
      widget.currentUser.password!,
      widget.currentUser.region!,
      widget.currentUser.registration_type!,
      experience,
      availability,
      workdays,
      cleaning_types,
      equipment,
      description,
    );
    print(widget.currentUser.id);
    print(widget.currentUser.email);
    print(widget.currentUser.registration_type);
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CleanerHomePage()),
      );
    }
    else{
      print("error adding infos ");
    }
    }


  @override
  void dispose() {
    experienceDropdownController.dispose();
    profileDescController.dispose();
    availabilityController.dispose();
    serviceTypeController.dispose();
    daySelectorController.dispose();
    equipmentSelectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  /*     Container(
                    margin: const EdgeInsets.only(top: 30, left: 20),
                    alignment: Alignment.topLeft,
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 120,
                      height: 20,
                    ),
                  ),*/
                  const Text(
                    "Finish your profile to help us know you better",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'How would you describe your experience ?',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                  BuildSelectedExperience(
                    dropdownController: experienceDropdownController,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Select cleaning services you offer',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                  ServiceTypeSelector(serviceTypeController: serviceTypeController),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Approximately, how many hours a week would you work?',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                  buildAvailability(availabilityController),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Select your work-days',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                  DaySelector(workDaysController: daySelectorController),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Do you have your own equipment ?',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                  EquipmentSelection(
                    onEquipmentChanged: (value){
                      equipmentSelectionController.value = value;

                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Add a profile description',
                      style: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
                    ),
                  ),
                  buildProfileDescriptionField(profileDescController),
                  SizedBox(
                    height: 40,
                  ),
                  buildCustomButton(context, 'Finish',onPressedHandler)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
