import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exercise/controller.dart';
import 'package:provider/provider.dart';
import './body.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(
              controller.isValid ? "Valid Form" : "Invalid Form",
            );
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          return BodyWidget();
        },
      ),
    );
  }
}
