import 'package:flutter/material.dart';
import 'package:flutter_app3/pages/products_widget.dart';
import 'package:flutter_app3/mechanics/counting.dart';

import '../mechanics/counting.dart';

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
                  Text('${widget.data.text}',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500)),
                  const Text('(M,X,L,XL)', style: TextStyle(color: Colors.grey)),
                  Text('${widget.data.count} \$',
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w500)),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final InstanceWidget widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5,
      top: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Text(
              '${widget.data.discount} %',
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            color: Colors.red),
      ),
    );
  }
}
