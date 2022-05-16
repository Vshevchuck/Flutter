import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/head_widget.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';
import 'package:flutter_app3/utils/text_styles/text_style.dart';

import '../../mechanics/data.dart';


class SelectedProductsWidget extends StatefulWidget {
  final Function callBack;
  const SelectedProductsWidget({Key? key,required this.callBack}) : super(key: key);

  @override
  State<SelectedProductsWidget> createState() => _SelectedProductsWidgetState();
}

class _SelectedProductsWidgetState extends State<SelectedProductsWidget> {
  void buyAll() {
    setState(() {
      for(int i=0;i<Data.products.length;i++)
        {
          Data.products[i].amount=0;
        }
      Data.selectedProducts = [];
      widget.callBack();
    });
  }

  void cancel() {
    Navigator.of(context).pushReplacementNamed('/main');
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InstanceRowWidget(
            instanceRow: Data.selectedProducts,
            function: () => setState(() {}),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  onPressed: buyAll,
                  child: const Text('Buy all',
                      style: TextStyle(color: Colors.black54))),
              OutlinedButton(
                  onPressed: cancel,
                  child: const Text('Back',
                      style: TextStyle(color: Colors.black54)))
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),);
  }
}
