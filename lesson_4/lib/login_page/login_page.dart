import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(children: [
        Stack(
          children: const [
            Image(
              image: AssetImage('assets/weather_logo.jpg'),
            ),
          ],
        ),
      ]),
    ));
  }
}
