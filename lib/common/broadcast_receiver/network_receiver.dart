import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';

class NetworkReceiver {
  NetworkReceiver._internal();

  static final NetworkReceiver _instance = NetworkReceiver._internal();

  static NetworkReceiver get instance => _instance;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  /// Init connectivity result and  listen connectivity changed
  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  /// Check network status by look up google.com page
  /// If result is not empty, Internet is connected
  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  /// Close stream when it is not using
  void disposeStream() => controller.close();
}