import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) => true);

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submitCreds(){
    String emailValue = _email.value;
    String passwordValue = _password.value;
    print('mail: $emailValue and password: $passwordValue');
  }

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();