import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/pages/instance_widget.dart';
import 'package:flutter_app3/pages/products_widget.dart';
import 'package:flutter_app3/pages/products_widget.dart';

import 'products_widget.dart';

class NumberOfPurchasesWidget extends StatefulWidget {
  final Function function;
  final Function function2;
  const NumberOfPurchasesWidget({
    Key? key,required this.function,required this.function2
  }) : super(key: key);

  @override
  State<NumberOfPurchasesWidget> createState() =>
      _NumberOfPurchasesWidgetState();
}

class _NumberOfPurchasesWidgetState extends State<NumberOfPurchasesWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: Column(
        children: [
          Row(
            children: [
              Text('${Counting.amount}',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart_outlined),
                onPressed: () {
                  setState(() {
                    Counting.allBuy();
                    Counting.checkBuy();
                    widget.function();
                    widget.function2();
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}