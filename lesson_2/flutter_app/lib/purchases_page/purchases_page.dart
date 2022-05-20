import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/head_widget.dart';
import 'package:flutter_app3/purchases_page/widgets/empty_basket_widget.dart';
import 'package:flutter_app3/purchases_page/widgets/selected_products_widget.dart';
import 'package:flutter_app3/utils/colors/colors.dart';

import '../data/data.dart';

class PurchasesPage extends StatefulWidget {
  const PurchasesPage({Key? key}) : super(key: key);

  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  int _routeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _routeIndex,
        backgroundColor: ColorsApp.colorBottomNavigation,
        elevation: 1.0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_travel_rounded), label: 'Purchases')
        ],
        onTap: onSelectedTab,
      ),
      appBar: AppBar(
        backgroundColor: ColorsApp.colorAppBar,
        elevation: 2.0,
        toolbarHeight: 100,
        // ignore: prefer_const_constructors
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // ignore: prefer_const_constructors
          child: SizedBox(
              width: double.infinity,
              height: 110,
              // ignore: prefer_const_constructors
              child: HeadWidget()),
        ),
      ),
      body: SingleChildScrollView(
        child: Data.selectedProducts.isEmpty
            // ignore: prefer_const_constructors
            ? EmptyBasketWidget()
            : SelectedProductsWidget(callBack: () => setState(() {})),
      ),
    );
  }

  void onSelectedTab(int index) {
    if (_routeIndex == index) return;
    {
      _routeIndex = index;
      if (_routeIndex == 0) {
        Navigator.of(context).pushReplacementNamed('/main');
      }
    }
  }
}
