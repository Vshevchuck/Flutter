import 'package:flutter/material.dart';

import '../main_page/widgets/products_widget.dart';
import '../utils/colors/colors.dart';
import '../utils/text_styles/text_style.dart';

class ProductInfo extends StatefulWidget {
  final ElementOfInstance data;

  const ProductInfo({Key? key, required this.data}) : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          toolbarHeight: 100,
          title: Column(
            children: [
              Stack(
                children: [
                  Image(
                    image: AssetImage(widget.data.image),
                  ),
                ],
              ),
              Text(widget.data.text, style: TextsStyle.productStyle),
              const Text('Comfortable hoodie, the best option for every day,'
                  ' 100% cotton, perfect combination with both sportswear '
                  'and jeans'),
              const Text('(M,X,L,XL)',
                  style: TextStyle(color: ColorsApp.colorSizeTable)),
              Text('${widget.data.count} \$', style: TextsStyle.countStyle),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Buy one'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Put away'),
                    ),
                  ]),
              IconButton(onPressed: () {}, icon: const Icon(Icons.home))
            ],
          ),
        ),
      ),
    );
  }
}
