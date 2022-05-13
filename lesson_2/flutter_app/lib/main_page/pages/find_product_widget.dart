import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/pages/products_widget.dart';

class FindProductsWidget extends StatelessWidget {
  final Function function;
  const FindProductsWidget({
    Key? key,required this.function
  }) : super(key: key);

  void findProduct(String str){
      InstanceRowWidgetState.findProduct = str;
      function();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 8.0,left: 16.0),
      child: TextField(
          onChanged: (String str) {
            findProduct(str);
          },
          cursorHeight: 20,
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              prefixIcon: Icon(Icons.zoom_in_sharp),
              isCollapsed: true)),
    );
  }
}
