import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/utils/images/images_name.dart';
import 'package:flutter_app3/main_page/pages/catalog_widget.dart';
import 'package:flutter_app3/main_page/pages/head_widget.dart';
import 'package:flutter_app3/main_page/pages/products_widget.dart';
import 'package:flutter_app3/main_page/pages/set_discount_widget.dart';

import 'pages/find_product_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ElementOfInstance> products = [
    ElementOfInstance(235, -15, 'hoodie #1', ImagesName.product1),
    ElementOfInstance(365, -10, 'hoodie #2', ImagesName.product2),
    ElementOfInstance(100, -25, 'hoodie #3', ImagesName.product3),
    ElementOfInstance(175, -20, 'hoodie #4', ImagesName.product4),
    ElementOfInstance(400, -5, 'hoodie #5', ImagesName.product5),
    ElementOfInstance(188, -22, 'hoodie #6', ImagesName.product6),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Padding(
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
