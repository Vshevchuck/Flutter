import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/data.dart';


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
              Text('${Data.selectedProducts.length}',
                  style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black)),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart_outlined, size: 25,color: Colors.black,),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/purchases');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}