import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/counting.dart';

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
          Text('Total amount - ',
              style: TextStyle(fontWeight: FontWeight.w500)),
          Text('${Counting.totalCount}', style: TextStyle(fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}
