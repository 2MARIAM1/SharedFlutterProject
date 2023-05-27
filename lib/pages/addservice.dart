import 'package:flutter/material.dart';
import 'package:test_project/utils/color_constant.dart';

import '../Components/custom_menu.dart';
import '../utils/image_constant.dart';
import 'loginpage.dart';

class AddServiceForm extends StatefulWidget {
  @override
  _AddServiceFormState createState() => _AddServiceFormState();
}

class _AddServiceFormState extends State<AddServiceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _selectedType;
  late String _location;
  late String _description;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      // Faire quelque chose avec les valeurs du formulaire
      print('Type de service : $_selectedType');
      print('Location : $_location');
      print('Description : $_description');

      // Réinitialiser le formulaire
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Type de service'),
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
                  decoration: InputDecoration(labelText: 'Description'),
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  // Action à effectuer lorsque le nouveau bouton est pressé

                  child: Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ]),
      Align(alignment: Alignment.bottomCenter, child: CustomMenuBar()),
    ]));
  }

  RaisedButton({required void Function() onPressed, required Text child}) {}
}
