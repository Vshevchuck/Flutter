import 'package:flutter/material.dart';
import 'package:flutter_app3/pages/instance_widget.dart';

class ElementOfInstance {
  final int count;
  final int discount;
  final String text;
  final String image;

  ElementOfInstance(this.count, this.discount, this.text, this.image);
}

class InstanceRowWidget extends StatefulWidget {
  final List<ElementOfInstance> instanceRow;
  final Function function;
  const InstanceRowWidget({Key? key, required this.instanceRow,required this.function})
      : super(key: key);

  @override
  State<InstanceRowWidget> createState() => _InstanceRowWidgetState();
}

class _InstanceRowWidgetState extends State<InstanceRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10.0,
      spacing: 10.0,
      children:
        widget.instanceRow.map((data) => InstanceWidget(data: data, function: widget.function)).toList(),
      );
  }
}