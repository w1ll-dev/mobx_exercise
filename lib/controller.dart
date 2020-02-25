import 'package:mobx/mobx.dart';
import './models/client.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  final client = Client();

  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName() {
    if (client.name == null) {
      return "your name is required.";
    } else if (client.name.length < 3) {
      return "invalide name.";
    }
    return null;
  }

  String validateEmail() {
    if (client.email == null) {
      return "your email is required.";
    } else if (!client.email.contains("@")) {
      return "invalid email.";
    }
    return null;
  }
}
