import 'package:flutter/material.dart';
import 'package:flutter_app3/pages/products_widget.dart';

class FindProductsWidget extends StatefulWidget {
  final Function function;
  const FindProductsWidget({
    Key? key,required this.function
  }) : super(key: key);

  @override
  State<FindProductsWidget> createState() => _FindProductsWidgetState();
}

class _FindProductsWidgetState extends State<FindProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
      child: TextField(
          onChanged: (String str) {
            setState(() {
              InstanceRowWidgetState.findProduct = str;
              widget.function();
            });
          },
          cursorHeight: 20,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              icon: Icon(Icons.zoom_in_sharp),
              isCollapsed: true)),
    );
  }
}
