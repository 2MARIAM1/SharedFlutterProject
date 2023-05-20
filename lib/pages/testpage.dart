import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class MyTestPage extends StatefulWidget {

  @override
  _MyTestPageState createState() => _MyTestPageState();
}

class _MyTestPageState extends State<MyTestPage> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              //################################################################################################
              // Rounded blue MultiSelectDialogField
              //################################################################################################
              MultiSelectDialogField(
                items: _items,
                title: Text("Animals"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Favorite Animals",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                  //_selectedAnimals = results;
                },
              ),

     ]
    ),
    ),
    )
    );
  }
}

/// Flutter code sample for [DropdownButton].

/*
const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: DropdownButtonExample(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}*/

/** SizedBox(height: 50),

    //################################################################################################
    // This MultiSelectBottomSheetField has no decoration, but is instead wrapped in a Container that has
    // decoration applied. This allows the ChipDisplay to render inside the same Container.
    //################################################################################################
    Container(
    decoration: BoxDecoration(
    color: Theme.of(context).primaryColor.withOpacity(.4),
    border: Border.all(
    color: Theme.of(context).primaryColor,
    width: 2,
    ),
    ),
    child: Column(
    children: <Widget>[
    MultiSelectBottomSheetField(
    initialChildSize: 0.4,
    listType: MultiSelectListType.CHIP,
    searchable: true,
    buttonText: Text("Favorite Animals"),
    title: Text("Animals"),
    items: _items,
    onConfirm: (values) {
    _selectedAnimals2 = values!.cast<Animal>();
    },
    chipDisplay: MultiSelectChipDisplay(
    onTap: (value) {
    setState(() {
    _selectedAnimals2.remove(value);
    });
    },
    ),
    ),
    _selectedAnimals2 == null || _selectedAnimals2.isEmpty
    ? Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.centerLeft,
    child: Text(
    "None selected",
    style: TextStyle(color: Colors.black54),
    ))
    : Container(),
    ],
    ),
    ),



    SizedBox(height: 40),
    //################################################################################################
    // MultiSelectDialogField with initial values
    //################################################################################################
    MultiSelectDialogField(
    onConfirm: (val) {
    _selectedAnimals5 = val;
    },
    dialogWidth: MediaQuery.of(context).size.width * 0.7,
    items: _items,
    initialValue:
    _selectedAnimals5, // setting the value of this in initState() to pre-select values.
    ),
    ],
    ),
    ),*/