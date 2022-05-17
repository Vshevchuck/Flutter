import 'package:flutter/material.dart';

import '../../utils/text_styles/text_style.dart';

class EmptyBasketWidget extends StatelessWidget {
  const EmptyBasketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void cancel() {
      Navigator.of(context).pushReplacementNamed('/main');
    }

    return Center(
        child: Column(
      children: [
        const SizedBox(height: 20),
        const Text('There are no items in the cart',
            style: TextsStyle.emptyBasketTextStyle),
        const SizedBox(height: 15),
        OutlinedButton(
            onPressed: cancel,
            child: const Text('Back', style: TextsStyle.cancelTextStyle))
      ],
    ));
  }
}
