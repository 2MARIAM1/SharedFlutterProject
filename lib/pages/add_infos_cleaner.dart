import 'package:flutter/material.dart';
import 'package:test_project/Components/SignUpComponents/days_selector.dart';
import 'package:test_project/Components/SignUpComponents/experience_selector.dart';
import 'package:test_project/Components/SignUpComponents/service_selector.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/next_round_button.dart';

class AddInfosCleanerPage extends StatefulWidget {
  const AddInfosCleanerPage({Key? key});

  @override
  State<AddInfosCleanerPage> createState() => _AddInfosCleanerPageState();
}

class _AddInfosCleanerPageState extends State<AddInfosCleanerPage> {
  final TextEditingController experienceDropdownController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Text(
              "Welcome cleaner",
              style: TextStyle(fontSize: 18),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.9,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF92A3FD),
                      const Color(0xFF92A3FD).withOpacity(0.1)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "Finish your profile to help us know you better",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'How would you describe your experience ?',
                        style: TextStyle(fontSize: 16),
                      ),
                      BuildSelectedExperience(
                        dropdownController: experienceDropdownController,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Select cleaning services you offer',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Expanded(
                        child: ServiceTypeSelector(),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Select your working days',
                        style: TextStyle(fontSize: 16),
                      ),
                      DaySelector(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RoundButton(
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
