import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sample_bloc/src/blocs/validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to sink
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  submit() {
    final _validEmail = _email.value;
    final _validPassword = _password.value;
    if (kDebugMode) {
      print('Valid email is $_validEmail & Valid password is $_validPassword');
    }
  }

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(emailValidator);

  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  dispose() {
    _email.close();
    _password.close();
  }
}
