import 'dart:async';

import 'package:bloc_example/model/loginmodel.dart';

class LoginBloc {
  final _loginModelController = StreamController<LoginModel>();
  final _isLoadingController = StreamController<bool>();

  // Streams for exposing data to the UI
  Stream<LoginModel> get loginModelStream => _loginModelController.stream;
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  // Sinks for receiving data from the UI
  Sink<LoginModel> get loginModelSink => _loginModelController.sink;
  Sink<bool> get isLoadingSink => _isLoadingController.sink;

  void login() async {
    // Set the isLoading flag to true
    isLoadingSink.add(true);

    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));

    // Get the latest value of the login model
    final loginModel = await loginModelStream;

    // TODO: Implement actual login logic here

    // Set the isLoading flag to false
    isLoadingSink.add(false);
  }

  // Dispose method to release resources
  void dispose() {
    _loginModelController.close();
    _isLoadingController.close();
  }
}
