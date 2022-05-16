import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/data.dart';
import '../main_page/widgets/head_widget.dart';
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
  void buyOne() {
    setState(() {
      if (widget.data.amount == 0) {
        widget.data.amount++;
        Data.selectedProducts.add(widget.data);
        ElementOfInstance.show(Data.selectedProducts);
        widget.data.color = ColorsApp.colorChoose;
      } else {
        Data.selectedProducts[Data.selectedProducts.indexOf(widget.data)]
            .amount++;
      }
      print("+");
    });
  }

  void putAway() {
    setState(() {
      if (widget.data.amount == 1) {
        Data.selectedProducts.remove(widget.data);
        widget.data.amount--;
        print("-");
        ElementOfInstance.show(Data.selectedProducts);
        widget.data.color = ColorsApp.colorNoChoose;
      } else if (widget.data.amount > 1) {
        Data.selectedProducts[Data.selectedProducts.indexOf(widget.data)]
            .amount--;
      }
    });
  }

  void home() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            // ignore: prefer_const_constructors
            child: SizedBox(
                width: double.infinity,
                height: 110,
                child: HeadWidget(function2: () => setState(() {}))),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 250,
                height: 350,
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage(widget.data.image),
                    ),
                  ],
                ),
              ),
              Text(widget.data.text, style: TextsStyle.productStyle),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 8.0),
                child: Text(
                    '   Comfortable hoodie, the best option for every day,'
                    ' 100% cotton, perfect combination with both sportswear '
                    'and jeans'),
              ),
              const Text('(M,X,L,XL)',
                  style: TextStyle(color: ColorsApp.colorSizeTable)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${widget.data.count} \$', style: TextsStyle.countStyle),
                  if (widget.data.amount > 0)
                    AmountWidget(widget: widget),
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: buyOne,
                      child: const Text('Buy one'),
                    ),
                    OutlinedButton(
                      onPressed: putAway,
                      child: const Text('Put away'),
                    ),
                  ]),
              IconButton(onPressed: home, icon: const Icon(Icons.home))
            ],
          ),
        ),
      ),
    );
  }
}

class AmountWidget extends StatelessWidget {
  const AmountWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductInfo widget;

  @override
  Widget build(BuildContext context) {
    return Row(children: [const SizedBox(width: 16),Text('${widget.data.amount}',
        style: const TextStyle(color: Colors.black45))]);
  }
}
