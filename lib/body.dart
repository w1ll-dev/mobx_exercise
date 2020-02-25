import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exercise/controller.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  Widget _sizedBox() {
    return SizedBox(
      height: 30,
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    return Center(
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
              onPressed: controller.isValid ? () {} : null,
              child: Text("save"),
            );
          })
        ],
      ),
    );
  }
}
