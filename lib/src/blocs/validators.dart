import 'dart:async';

class Validators{
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@')){
        sink.add(data);
      }else{
        sink.addError('Enter a valid email');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if(data.length>4){
        sink.add(data);
      }else{
        sink.addError('Password must be at least 4 characters');
      }
    },
  );


}