import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/pages/products_widget.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/main_page/utils/images/text_style.dart';

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
      if(widget.data.color==Colors.white) {
        Counting.buyOne(widget.data.count);
        Counting.countOne();
        widget.data.color=Colors.black12;
      }
      else{
        Counting.discountOne();
        Counting.deleteOne(widget.data.count);
        widget.data.color=Colors.white;
      }
      widget.function();
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget? Discount;
    if(checkDiscount)
      {
        Discount=DiscountWidget(widget: widget);
      }
    else
      {
        Discount=null;
      }

    return Container(
      width: 150,
      color: widget.data.color,
      child: InkWell(
        splashColor: Colors.blueGrey,
        onTap: () {
          chooseProduct();
        },
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
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
                      Container(child: Discount),
                      const Positioned(
                          right: 5,
                          top: 10,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white54,
                          )),
                    ],
                  ),
                  Text(widget.data.text,
                      style: TextsStyle.productStyle),
                  const Text('(M,X,L,XL)', style: TextStyle(color: Colors.grey)),
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
