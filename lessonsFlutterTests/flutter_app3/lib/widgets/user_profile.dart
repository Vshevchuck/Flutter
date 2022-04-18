import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Налаштування'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        color: Colors.lightGreenAccent,
        //maximum allowable width
        width: double.infinity,
        child: Column(
          //column in center
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: Placeholder(),
            ),
            Text('Шевчук Владислав'),
            Text('+380688110424'),
            Text('vlad_shepa'),
          ],
        ),
      ),
    );
  }
}
