import 'package:flutter/material.dart';

import '../utils/image_constant.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                ImageConstant.imgRectangle21,
                fit: BoxFit.fill,
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.phone))
          ]),
        ),
        Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: TextFormField(
                  decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'write yr message',
              )),
            ),
          ],
        )
      ]),
    );
  }
}
