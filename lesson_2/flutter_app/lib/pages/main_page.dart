import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/images/images_name.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app3/pages/catalog_widget.dart';
import 'package:flutter_app3/pages/head_widget.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/pages/products_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ElementOfInstance> products =[
    ElementOfInstance(235, -15, 'hoodie #1', ImagesName.product1),
    ElementOfInstance(365, -10, 'hoodie #2', ImagesName.product2),
    ElementOfInstance(100, -25, 'hoodie #3', ImagesName.product3),
    ElementOfInstance(175, -20, 'hoodie #4', ImagesName.product4),
    ElementOfInstance(400, -5, 'hoodie #5', ImagesName.product5),
    ElementOfInstance(188, -22, 'hoodie #6', ImagesName.product6),
  ];
  void updateMainWidget() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  height: 110,
                  child: HeadWidget(),
                ),
              ),
               CatalogWidget(),
              InstanceRowWidget(instanceRow:products,function : updateMainWidget),
            ],
          ),
      ),
    );
  }
}

