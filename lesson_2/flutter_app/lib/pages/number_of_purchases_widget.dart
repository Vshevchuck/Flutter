import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/counting.dart';

class NumberOfPurchasesWidget extends StatefulWidget {
  final Function function;
  const NumberOfPurchasesWidget({
    Key? key,required this.function,
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
                    Counting.checkBuy();
                    widget.function();
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