import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/counting.dart';

import '../utils/images/text_style.dart';

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
      left: 10,
      bottom: 10,
      child: Row(
        children: [
          const Text('Total amount - ',
              style:  TextsStyle.totalAmountStyle),
          Text('${Counting.totalCount}', style: TextsStyle.totalAmountStyle)
        ],
      ),
    );
  }
}
