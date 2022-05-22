import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';

class FindProductsWidget extends StatelessWidget {
  final Function callBack;

  const FindProductsWidget({Key? key, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 8.0, left: 16.0),
      child: TextField(
          onChanged: (String str) {
            _findProduct(str);
          },
          cursorHeight: 20,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              prefixIcon: Icon(Icons.zoom_in_sharp),
              isCollapsed: true)),
    );
  }

  void _findProduct(String str) {
    InstanceRowWidget.findProduct = str;
    callBack();
  }
}
