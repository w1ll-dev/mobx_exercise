import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exercise/controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  @override
  Widget build(BuildContext context) {
    Widget _textField(
        {String labelText, onChanged, String Function() errorText}) {
      return TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText(),
        ),
      );
    }

    Widget _sizedBox() {
      return SizedBox(
        height: 30,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Mobx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Observer(
              builder: (_) {
                return _textField(
                  labelText: "name",
                  onChanged: controller.client.changeName,
                  errorText: controller.validateName,
                );
              },
            ),
            _sizedBox(),
            Observer(
              builder: (_) {
                return _textField(
                  labelText: "email",
                  onChanged: controller.client.changeMail,
                  errorText: controller.validateEmail,
                );
              },
            ),
            _sizedBox(),
            Observer(builder: (_) {
              return RaisedButton(
                onPressed: controller.isValidate() ? () {} : null,
                child: Text("save"),
              );
            })
          ],
        ),
      ),
    );
  }
}
