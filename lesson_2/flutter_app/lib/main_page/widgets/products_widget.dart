import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/colors/colors.dart';
import 'package:flutter_app3/main_page/widgets/instance_widget.dart';
import 'package:flutter_app3/data/data.dart';

import '../../utils/models/models.dart';
import '../../utils/text_styles/text_style.dart';

class InstanceRowWidget extends StatefulWidget {
  final List<ElementOfInstance> instanceRow;
  final Function callBack;

  const InstanceRowWidget(
      {Key? key, required this.instanceRow, required this.callBack})
      : super(key: key);

  @override
  State<InstanceRowWidget> createState() => InstanceRowWidgetState();
}

class InstanceRowWidgetState extends State<InstanceRowWidget> {
  static String? findProduct;

  void _cancel() {
    findProduct = '';
    widget.callBack();
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
                  callBack: widget.callBack),
              OutlinedButton(
                  onPressed: _cancel,
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
          .map((data) => InstanceWidget(data: data, callBack: widget.callBack))
          .toList(),
    );
  }
}
