import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/colors/colors.dart';
import 'package:flutter_app3/utils/text_styles/text_style.dart';
import 'instance_widget.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final InstanceWidget widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 5,
      top: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Text(
              '${widget.data.discount} %',
              style: TextsStyle.discountStyle,
            ),
            color: ColorsApp.colorDiscountContainer),
      ),
    );
  }
}
