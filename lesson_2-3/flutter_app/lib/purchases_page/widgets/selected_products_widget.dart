import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';
import 'package:flutter_app3/utils/text_styles/text_style.dart';

import '../../data/data.dart';

class SelectedProductsWidget extends StatefulWidget {
  final Function callBack;

  const SelectedProductsWidget({Key? key, required this.callBack})
      : super(key: key);

  @override
  State<SelectedProductsWidget> createState() => _SelectedProductsWidgetState();
}

class _SelectedProductsWidgetState extends State<SelectedProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          InstanceRowWidget(
            instanceRow: Data.selectedProducts,
            callBack: () => setState(() {}),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  onPressed: _buyAll,
                  child:
                      const Text('Buy all', style: TextsStyle.buyAllTextStyle)),
              OutlinedButton(
                  onPressed: _cancel,
                  child: const Text('Back', style: TextsStyle.backTextStyle))
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void _cancel() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  void _buyAll() {
    for (int i = 0; i < Data.products.length; i++) {
      Data.products[i].amount = 0;
    }
    Data.selectedProducts = [];
    widget.callBack();
  }
}
