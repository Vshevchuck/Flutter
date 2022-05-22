import 'package:flutter/material.dart';
import 'package:flutter_app3/data/data.dart';
import 'package:flutter_app3/product_info_page/widgets/one_amount_widget.dart';
import '../main_page/widgets/head_widget.dart';
import '../utils/colors/colors.dart';
import '../utils/models/models.dart';
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
    double appBarSize = 110;
    var screenHeight = (MediaQuery.of(context).size.height) - appBarSize;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.colorAppBar,
          elevation: 2.0,
          toolbarHeight: 100,
          // ignore: prefer_const_constructors
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            // ignore: prefer_const_constructors
            child: SizedBox(
                width: double.infinity,
                height: appBarSize,
                // ignore: prefer_const_constructors
                child: HeadWidget()),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight > 625 ? screenHeight : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
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
                    Text('${widget.data.count} \$',
                        style: TextsStyle.countStyle),
                    if (widget.data.amount > 0) OneAmountWidget(widget: widget),
                  ],
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: _buyOne,
                        child: const Text('Buy one',
                            style: TextsStyle.buyOneTextStyle),
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 20,
                                    color: ColorsApp.colorButton,
                                    style: BorderStyle.solid),
                              ),
                            ),
                          ),
                          onPressed: _putAway,
                          child: const Text('Put away',
                              style: TextsStyle.putAwayTextStyle)),
                    ]),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: _home,
                    icon: const Icon(Icons.home),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _home() {
    Navigator.of(context).pushReplacementNamed('/main');
  }

  void _buyOne() {
    setState(() {
      if (widget.data.amount == 0) {
        widget.data.amount++;
        Data.selectedProducts.add(widget.data);
        widget.data.color = ColorsApp.colorChoose;
      } else {
        Data.selectedProducts[Data.selectedProducts.indexOf(widget.data)]
            .amount++;
      }
    });
  }

  void _putAway() {
    if (widget.data.amount == 1) {
      Data.selectedProducts.remove(widget.data);
      widget.data.amount--;
      widget.data.color = ColorsApp.colorNoChoose;
    } else if (widget.data.amount > 1) {
      Data.selectedProducts[Data.selectedProducts.indexOf(widget.data)]
          .amount--;
    }
  }
}
