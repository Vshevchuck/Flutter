import 'package:flutter/material.dart';
import 'package:flutter_app3/data/data.dart';
import 'package:flutter_app3/utils/text_styles/text_style.dart';

class AmountWidget extends StatefulWidget {
  const AmountWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      bottom: 8,
      child: Text('Total amount - ${getSum()}',
          style: TextsStyle.totalAmountStyle),
    );
  }

  int getSum() {
    int sum = 0;
    for (int i = 0; i < Data.selectedProducts.length; i++) {
      if (Data.selectedProducts[i].amount == 1) {
        sum += Data.selectedProducts[i].count;
      } else {
        sum += Data.selectedProducts[i].count * Data.selectedProducts[i].amount;
      }
    }
    return sum;
  }
}
