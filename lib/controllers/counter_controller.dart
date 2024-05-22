import 'dart:js_interop';

import 'package:dars41/models/counter.dart';

class CounterController {
  Counter _counter = Counter(0);

  int get value {
    return _counter.value;
  }

  void increment() {
    _counter.value++;
  }
}
