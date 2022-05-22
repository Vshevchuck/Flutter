import 'package:flutter/material.dart';
import 'package:flutter_app3/data/data.dart';
import 'package:flutter_app3/utils/text_styles/text_style.dart';

import '../../utils/colors/colors.dart';

class NumberOfPurchasesWidget extends StatelessWidget {
  final Function callBack;

  const NumberOfPurchasesWidget({Key? key, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: Row(
        children: [
          Text('${_countAmount()}', style: TextsStyle.sumStyle),
          IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
              size: 25,
              color: ColorsApp.colorBasketIcon,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/purchases');
            },
          )
        ],
      ),
    );
  }

  int _countAmount() {
    int sum = 0;
    for (int i = 0; i < Data.selectedProducts.length; i++) {
      sum += Data.selectedProducts[i].amount;
    }
    return sum;
  }
}
