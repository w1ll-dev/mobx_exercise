import 'package:mobx/mobx.dart';

class Controller {
  var _counter = Observable(0);
  Action increment;
  int get counter => _counter.value;
  set counter(int newValue) => _counter.value = newValue;

  Controller() {
    increment = Action(_increment);
  }

  _increment() {
    counter++;
  }
}
