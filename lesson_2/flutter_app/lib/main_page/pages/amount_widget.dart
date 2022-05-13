import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/main_page.dart';
import 'package:flutter_app3/mechanics/counting.dart';

import '../utils/text_styles/text_style.dart';

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
    int getSum() {
      int sum = 0;
      for (int i = 0; i < MainPage.selectedProducts.length; i++) {
        sum+=MainPage.selectedProducts[i].count;
      }
      return sum;
    }
    return Positioned(
      left: 8,
      bottom: 8,
      child: Row(
        children: [
          const Text('Total amount - ',
              style: TextsStyle.totalAmountStyle),
          Text('${getSum()}', style: TextsStyle.totalAmountStyle)
        ],
      ),
    );
  }
}
