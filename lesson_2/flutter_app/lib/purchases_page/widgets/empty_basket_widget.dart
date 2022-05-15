import 'package:flutter/material.dart';
import 'package:flutter_app3/purchases_page/widgets/selected_products_widget.dart';

class EmptyBasketWidget extends StatelessWidget {
  const EmptyBasketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void cancel() {
      Navigator.of(context).pushReplacementNamed('/main');
    }

    return Center(
        child: Column(
      children: [
        const SizedBox(height: 20),
        const Text('There are no items in the cart',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black54)),
        const SizedBox(height: 15),
        OutlinedButton(
            onPressed: cancel,
            child: const Text('Back', style: TextStyle(color: Colors.black54)))
      ],
    ));
  }
}
