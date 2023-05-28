import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Components/custom_menu.dart';
import '../utils/color_constant.dart';

class AddServiceForm extends StatefulWidget {
  @override
  _AddServiceFormState createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _selectedType;
  late String _location;
  late String _description;
  late String _surface;
  late String _date;
  late double _estimatedPrice;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      // Appeler l'API pour enregistrer le poste
      _createPoste();

      // Réinitialiser le formulaire
      _formKey.currentState?.reset();
    }
  }

  Future<void> _createPoste() async {
    final url = Uri.parse(
        'http://localhost:8083/postes/1'); // Remplacez l'URL avec l'URL de votre backend et l'ID de l'utilisateur
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'description': _description,
        'cleaningType': _selectedType,
        'location': _location,
        'estimatedPrice': _estimatedPrice,
        'surface': _surface,
        'serviceDate': _date,
        'booked': false, // Remplacez par la valeur souhaitée
      }),
    );

    if (response.statusCode == 201) {
      print('Poste créé avec succès.');
    } else {
      print('Erreur lors de la création du poste.');
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
                    'Add Service',
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Type de service'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer le type de service';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _selectedType = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Location'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer la location';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _location = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Surface'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer la surface';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _surface = value!;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Date'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer la date';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _date = value!;
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Estimated Price'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer le prix estimé';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _estimatedPrice = double.parse(value!);
                          },
                        ),
                        Container(
                          height:
                              100, // Définir la hauteur souhaitée de l'espace
                          child: TextFormField(
                            maxLines:
                                null, // Permet à TextFormField de s'ajuster automatiquement à la hauteur définie
                            decoration: InputDecoration(
                              labelText:
                                  'Description', // Label du TextFormField
                              border:
                                  OutlineInputBorder(), // Style de la bordure
                              // Vous pouvez ajouter d'autres propriétés de décoration selon vos besoins
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Veuillez entrer la description';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _description = value!;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Done'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomMenuBar(),
          ),
        ],
      ),
    );
  }
}
