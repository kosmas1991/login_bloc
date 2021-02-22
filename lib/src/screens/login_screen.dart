import 'package:flutter/material.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(),
          passwordField(),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(),
        ],
      ),
    );
  }
  Widget emailField(){
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@gmail.com',
              labelText: 'Enter your email',
              errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(){
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(){
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(

          onPressed: snapshot.hasData ? () => { bloc.submitCreds()} : null

          ,
          child: Text('Log in'),
          color: Colors.blue,
        );
      },
    );
  }
}