import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app3/images/images_name.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                height: 110,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: const Image(
                        width: 120,
                        height: 90,
                        image: AssetImage(ImagesName.logo),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 0,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text('0',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              Icon(Icons.add_shopping_cart_outlined,
                                  color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 1,
                      child: Row(
                        children: [
                          Text('Total amount - ',
                              style: TextStyle(fontWeight: FontWeight.w500)),
                          Text('0',
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top : 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: Text('hoody',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17))),
                  Container(
                      child: Text('jeans',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
