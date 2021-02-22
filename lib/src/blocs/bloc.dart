import 'dart:async';
import 'validators.dart';

class Bloc extends Validators{
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  //add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  dispose(){
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();