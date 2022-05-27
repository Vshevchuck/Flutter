import 'package:flutter/material.dart';
import 'package:flutter_app3/widgets/first_page.dart';
import 'package:flutter_app3/widgets/second_page.dart';
import 'package:flutter_app3/widgets/third_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/first' :(context)=>FirstPage(),
        '/second' : (context)=> SecondPage(),
        '/third' : (context)=> ThirdPage(),
      },
      initialRoute: '/first',
    );
  }
}