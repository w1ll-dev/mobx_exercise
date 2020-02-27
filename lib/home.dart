import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_exercise/controller.dart';
import './body.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<Controller>();
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
