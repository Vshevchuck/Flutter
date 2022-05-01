import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/images/images_name.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app3/widgets/catalog_widget.dart';
import 'package:flutter_app3/widgets/head_widget.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int amount = 0;
  int discount = 30;
  int count = 455;
  int total=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                height: 110,
                child: HeadWidget(amount,total),
              ),
            ),
            CatalogWidget(),
            GestureDetector(
              onTap: () {
                setState(() {
                  amount++;
                  total+=count;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    //color: Colors.red,
                    width: 150,
                    child: Column(children: [
                      Stack(
                        children: [
                          const Image(
                            image: AssetImage(ImagesName.product1),
                          ),
                          Positioned(
                            left: 5,
                            top: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Text(
                                    '$discount %',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  color: Colors.red),
                            ),
                          ),
                          Positioned(
                              right: 5,
                              top: 10,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      Text('Hoodye #1',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500)),
                      Text('(M,X,L,XL)', style: TextStyle(color: Colors.grey)),
                      Text('$count \$',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w500)),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
