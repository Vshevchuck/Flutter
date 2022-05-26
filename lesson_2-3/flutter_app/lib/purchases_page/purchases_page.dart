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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              child: HeadWidget(callBack: () => setState(() {}))),
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
}
