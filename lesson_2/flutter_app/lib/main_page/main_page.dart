import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/images/images_name.dart';
import 'package:flutter_app3/main_page/widgets/catalog_widget.dart';
import 'package:flutter_app3/main_page/widgets/head_widget.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';
import 'package:flutter_app3/main_page/widgets/set_discount_widget.dart';

import 'widgets/find_product_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static List<ElementOfInstance> selectedProducts = [];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _routeIndex=0;
  List<ElementOfInstance> products = [
    ElementOfInstance(235, -15, 'hoodie #1', ImagesName.product1),
    ElementOfInstance(365, -10, 'hoodie #2', ImagesName.product2),
    ElementOfInstance(100, -25, 'hoodie #3', ImagesName.product3),
    ElementOfInstance(175, -20, 'hoodie #4', ImagesName.product4),
    ElementOfInstance(400, -5, 'hoodie #5', ImagesName.product5),
    ElementOfInstance(188, -22, 'hoodie #6', ImagesName.product6),
  ];
  void onSelectedTab(int index){
    if(_routeIndex==index) return;
    {
      setState(() {
        _routeIndex=index;
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
          backgroundColor: Colors.white38,
          elevation: 1.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Main'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_travel_rounded), label: 'Purchases' )
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
              // ignore: prefer_const_constructors
              // Because count amount and costs don't work with const
              child: HeadWidget(function2: () => setState(() {})),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: prefer_const_constructor
              FindProductsWidget(function: () => setState(() {})),
              SetDiscountWidget(function: () => setState(() {})),
              const CatalogWidget(),
              InstanceRowWidget(
                  instanceRow: products, function: () => setState(() {})),
            ],
          ),
        ),
      ),
    );
  }
}
