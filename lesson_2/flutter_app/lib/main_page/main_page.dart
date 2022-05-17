import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/data.dart';
import 'package:flutter_app3/main_page/widgets/catalog_widget.dart';
import 'package:flutter_app3/main_page/widgets/head_widget.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';
import 'package:flutter_app3/main_page/widgets/set_discount_widget.dart';

import 'widgets/find_product_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _routeIndex = 0;
  void onSelectedTab(int index) {
    if (_routeIndex == index) return;
    {
      setState(() {
        _routeIndex = index;
        if (_routeIndex == 1) {
          Navigator.of(context).pushReplacementNamed('/purchases');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            // ignore: prefer_const_constructors
            child: SizedBox(
              width: double.infinity,
              height: 110,
              // ignore: prefer_const_constructors
              // Because count amount and costs don't work with const
              child: HeadWidget(),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: prefer_const_constructor
              FindProductsWidget(callBack: () => setState(() {})),
              SetDiscountWidget(callBack: () => setState(() {})),
              const CatalogWidget(),
              InstanceRowWidget(
                  instanceRow: Data.products, function: () => setState(() {})),
            ],
          ),
        ),
      ),
    );
  }
}
