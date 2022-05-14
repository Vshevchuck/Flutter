import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/colors/colors.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/main_page/widgets/instance_widget.dart';
import 'package:flutter_app3/main_page/main_page.dart';

class ElementOfInstance {
  final int count;
  final int discount;
  final String text;
  final String image;
  Color color = ColorsApp.colorNoChoose;

  ElementOfInstance(this.count, this.discount, this.text, this.image);

  static void show(List<ElementOfInstance> product) {
    for (int i = 0; i < product.length; i++) {
      print(product[i].text);
    }
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

  @override
  Widget build(BuildContext context) {
    if (MainPage.selectedProducts.isEmpty) {
      for (int i = 0; i < widget.instanceRow.length; i++) {
        widget.instanceRow.elementAt(i).color = ColorsApp.colorNoChoose;
      }
    }
    if (findProduct != null && findProduct != '') {
      for (int i = 0; i < widget.instanceRow.length; i++) {
        if (widget.instanceRow.elementAt(i).text == findProduct) {
          return InstanceWidget(
              data: widget.instanceRow.elementAt(i), function: widget.function);
        }
      }
      return Text('product not found');
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
