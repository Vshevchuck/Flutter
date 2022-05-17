import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/colors/colors.dart';
import 'package:flutter_app3/main_page/widgets/instance_widget.dart';
import 'package:flutter_app3/mechanics/data.dart';

import '../../utils/text_styles/text_style.dart';

class ElementOfInstance {
  final int count;
  final int discount;
  final String text;
  final String image;
  Color color = ColorsApp.colorNoChoose;
  int amount = 0;

  ElementOfInstance(this.count, this.discount, this.text, this.image);

  static void show(List<ElementOfInstance> product) {
    for (int i = 0; i < product.length; i++) {
      print('${product[i].text} - ${product[i].color}');
    }
    print('----------');
  }
}

class InstanceRowWidget extends StatefulWidget {
  final List<ElementOfInstance> instanceRow;
  final Function function;

  const InstanceRowWidget(
      {Key? key, required this.instanceRow, required this.function})
      : super(key: key);

  @override
  State<InstanceRowWidget> createState() => InstanceRowWidgetState();
}

class InstanceRowWidgetState extends State<InstanceRowWidget> {
  static String? findProduct;

  void cancel() {
    findProduct = '';
    widget.function();
  }

  @override
  Widget build(BuildContext context) {
    if (Data.selectedProducts.isEmpty) {
      for (int i = 0; i < widget.instanceRow.length; i++) {
        widget.instanceRow.elementAt(i).color = ColorsApp.colorNoChoose;
      }
    }
    if (findProduct != null && findProduct != '') {
      for (int i = 0; i < widget.instanceRow.length; i++) {
        if (widget.instanceRow.elementAt(i).text == findProduct) {
          return Column(
            children: [
              InstanceWidget(
                  data: widget.instanceRow.elementAt(i),
                  function: widget.function),
              OutlinedButton(
                  onPressed: cancel,
                  child: const Text('Back', style: TextsStyle.cancelTextStyle))
            ],
          );
        }
      }
      return const Text('Product not found');
    }
    return Wrap(
      runSpacing: 10.0,
      spacing: 10.0,
      children: widget.instanceRow
          .map((data) => InstanceWidget(data: data, function: widget.function))
          .toList(),
    );
  }
}
