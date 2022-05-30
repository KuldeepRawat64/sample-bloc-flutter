import 'package:flutter/material.dart';
import 'package:sample_bloc/src/blocs/bloc.dart';
import 'package:sample_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
            onChanged: bloc.changeEmail,
            decoration: InputDecoration(
              hintText: 'your@example.com',
              labelText: 'Email Address',
              errorText: snapshot.error?.toString(),
            ));
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.error?.toString(),
            hintText: 'Password',
            labelText: 'Password',
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return ElevatedButton(
          onPressed: !snapshot.hasData ? null : bloc.submit,
          child: const Text('Login'),
        );
      },
    );
  }
}
