import 'package:flutter/material.dart';
import 'package:test_project/pages/profi-page.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../utils/image_constant.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String username = 'Sofia';
  String email = 'utilisateur@example.com';
  String phoneNumber = '+212 670-679-823';
  String selectedLocation = 'Rabat';
  List<String> locations = ['Rabat', 'Casablanca', 'Marrakech', 'Tanger'];
  List<String> selectedWorkingDays = [];
  bool showWorkingDays = false;

  void _updateProfile() {
    // Action à effectuer lorsque le bouton "Done" est pressé
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  void _changeProfileImage() {
    // Action à effectuer lorsque l'utilisateur souhaite changer l'image de profil
  }

  void _toggleWorkingDay(String day) {
    // Ajouter ou supprimer le jour de travail de la liste sélectionnée
    if (selectedWorkingDays.contains(day)) {
      setState(() {
        selectedWorkingDays.remove(day);
      });
    } else {
      setState(() {
        selectedWorkingDays.add(day);
      });
    }
  }

  void _toggleWorkingDaysList() {
    // Afficher ou masquer la liste des jours de travail
    setState(() {
      showWorkingDays = !showWorkingDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            GestureDetector(
              onTap: _changeProfileImage,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  ImageConstant.imgRectangle21,
                ),
                radius: 45,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                onChanged: (value) {
                  // Mettre à jour le nom d'utilisateur
                  setState(() {
                    username = value;
                  });
                },
                controller: TextEditingController(text: username),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  // Mettre à jour l'adresse e-mail
                  setState(() {
                    email = value;
                  });
                },
                controller: TextEditingController(text: email),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  // Mettre à jour le numéro de téléphone
                  setState(() {
                    phoneNumber = value;
                  });
                },
                controller: TextEditingController(text: phoneNumber),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Working Days',
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: _toggleWorkingDaysList,
                        icon: Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
                  if (showWorkingDays)
                    Wrap(
                      spacing: 10,
                      children: [
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday',
                        'Sunday',
                      ].map((String day) {
                        return FilterChip(
                          label: Text(day),
                          selected: selectedWorkingDays.contains(day),
                          onSelected: (selected) => _toggleWorkingDay(day),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<String>(
                    value: selectedLocation,
                    items: locations.map((String location) {
                      return DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Mettre à jour la localisation sélectionnée
                      setState(() {
                        selectedLocation = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: _updateProfile,
                child: Text('Done'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomMenuBar(),
    );
  }
}
