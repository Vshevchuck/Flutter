import 'package:flutter/material.dart';

import 'login_page/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/login' :(context)=>const LoginPage(),},
        initialRoute: '/login',
    );
  }
}