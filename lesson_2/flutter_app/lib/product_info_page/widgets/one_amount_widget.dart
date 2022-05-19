import 'package:flutter/material.dart';

import '../../utils/text_styles/text_style.dart';
import '../product_info_page.dart';

class OneAmountWidget extends StatelessWidget {
  final ProductInfo widget;
  const OneAmountWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 16),
      Text('${widget.data.amount}', style: TextsStyle.productAmount)
    ]);
  }
}
