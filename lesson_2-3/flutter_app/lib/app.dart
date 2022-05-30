import 'package:flutter/material.dart';
import 'lib.dart';
import 'main_page/main_page.dart';
import 'purchases_page/purchases_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/main' :(context)=>const MainPage(),
      '/purchases' : (context)=>const PurchasesPage()},
      initialRoute: '/main',
    );
  }
}