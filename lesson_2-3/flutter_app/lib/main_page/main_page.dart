import 'package:flutter/material.dart';
import 'package:flutter_app3/data/data.dart';
import 'package:flutter_app3/main_page/widgets/catalog_widget.dart';
import 'package:flutter_app3/main_page/widgets/head_widget.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';
import 'package:flutter_app3/main_page/widgets/set_discount_widget.dart';

import '../utils/colors/colors.dart';
import 'widgets/find_product_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.colorAppBar,
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
                  instanceRow: Data.products, callBack: () => setState(() {})),
            ],
          ),
        ),
      ),
    );
  }
}
