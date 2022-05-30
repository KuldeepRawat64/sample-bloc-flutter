import 'package:flutter/material.dart';
import 'package:sample_bloc/src/blocs/provider.dart';

import 'screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: const MaterialApp(
          title: 'Login to App',
          home: Scaffold(
            body: LoginScreen(),
          )),
    );
  }
}
