import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/main_page/main_page.dart';


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
  void buyAll(){
    setState(() {
      MainPage.selectedProducts=[];
      widget.function();
      widget.function2();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: Column(
        children: [
          Row(
            children: [
              Text('${MainPage.selectedProducts.length}',
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart_outlined),
                onPressed: () {
                  buyAll();
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}