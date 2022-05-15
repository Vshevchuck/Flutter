import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/head_widget.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';

import '../main_page/main_page.dart';
import '../main_page/widgets/products_widget.dart';
import '../main_page/widgets/products_widget.dart';
import '../mechanics/data.dart';

class PurchasesPage extends StatefulWidget {
  const PurchasesPage({Key? key}) : super(key: key);

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  int _routeIndex = 1;

  void onSelectedTab(int index) {
    if (_routeIndex == index) return;
    {
      setState(() {
        _routeIndex = index;
        if (_routeIndex == 0) {
          Navigator.of(context).pushReplacementNamed('/main');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _routeIndex,
        backgroundColor: Colors.black12,
        elevation: 1.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_travel_rounded), label: 'Purchases')
        ],
        onTap: onSelectedTab,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // ignore: prefer_const_constructors
          child: SizedBox(
              width: double.infinity,
              height: 110,
              child: HeadWidget(function2: () => setState(() {}))),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              InstanceRowWidget(
                instanceRow: Data.selectedProducts,
                function: () => setState(() {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
