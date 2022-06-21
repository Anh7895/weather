import 'dart:async';

class MyStream {
  bool statusNotification = false;
  StreamController counterController = new StreamController<bool>();
  Stream get counterStream => counterController.stream;

  void increment(bool value) {
    statusNotification  = value;
    counterController.sink.add(statusNotification);
  }

  void dispose() {
    counterController.close();
  }
}