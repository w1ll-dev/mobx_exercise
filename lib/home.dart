import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exercise/controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Mobx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (name) {
                controller.changeName(name);
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
              onChanged: (lastName) {
                controller.changeLastName(lastName);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Observer(
              builder: (_) {
                return Text('${controller.name} ${controller.lastName}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
