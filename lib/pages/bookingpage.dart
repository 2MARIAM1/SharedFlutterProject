import 'package:flutter/material.dart';
import '../Components/custom_menu.dart';

import '../utils/color_constant.dart';

class BookingPage extends StatefulWidget {
  final bool booked;

  BookingPage({required this.booked});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Service> services = [
    Service(description: 'Service 1'),
    Service(description: 'Service 2'),
    Service(description: 'Service 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: ColorConstant.indigoA100,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            service.description,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: ColorConstant.indigoA100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            widget.booked ? 'Accepté' : 'en attent....',
                            style: TextStyle(
                              color: widget.booked ? Colors.green : Colors.red,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomMenuBar(),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String description;

  Service({required this.description});
}
