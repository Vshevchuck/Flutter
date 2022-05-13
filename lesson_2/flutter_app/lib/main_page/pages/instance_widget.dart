import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/pages/products_widget.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/main_page/utils/text_styles/text_style.dart';
import 'package:flutter_app3/main_page/main_page.dart';

import '../utils/colors/colors.dart';
import 'discount_widget.dart';

class InstanceWidget extends StatefulWidget {
  final ElementOfInstance data;
  final Function function;

  const InstanceWidget({Key? key, required this.data, required this.function})
      : super(key: key);

  @override
  State<InstanceWidget> createState() => InstanceWidgetState();
}

class InstanceWidgetState extends State<InstanceWidget> {
  static bool checkDiscount=true;
  void chooseProduct(){
    setState(() {
      if(!MainPage.selectedProducts.contains(widget.data)) {
        MainPage.selectedProducts.add(widget.data);
        ElementOfInstance.show(MainPage.selectedProducts);
        Counting.buyOne(widget.data.count);
        Counting.countOne();
        widget.data.color=ColorsApp.colorChoose;
      }
      else{
        MainPage.selectedProducts.remove(widget.data);
        ElementOfInstance.show(MainPage.selectedProducts);
        Counting.discountOne();
        Counting.deleteOne(widget.data.count);
        widget.data.color=ColorsApp.colorNoChoose;
      }
      widget.function();
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget? discount;
    if(checkDiscount)
      {
        discount=DiscountWidget(widget: widget);
      }
    else
      {
        discount=null;
      }
    return Container(
      width: 150,
      color: widget.data.color,
      child: InkWell(
        splashColor: ColorsApp.colorClick,
        onTap: () {
          chooseProduct();
        },
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 200,
                height: 250,
                child:Column(children: [
                  Stack(
                    children: [
                      Image(
                        image: AssetImage(widget.data.image),
                      ),
                      Container(child: discount),
                      const Positioned(
                          right: 5,
                          top: 10,
                          child: Icon(
                            Icons.favorite,
                            color: ColorsApp.colorIconsFavorite,
                          )),
                    ],
                  ),
                  Text(widget.data.text,
                      style: TextsStyle.productStyle),
                  const Text('(M,X,L,XL)', style: TextStyle(color: ColorsApp.colorSizeTable)),
                  Text('${widget.data.count} \$',
                      style: TextsStyle.countStyle),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

