import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/products_widget.dart';
import 'package:flutter_app3/utils/text_styles/text_style.dart';
import 'package:flutter_app3/mechanics/data.dart';

import 'package:flutter_app3/utils/colors/colors.dart';
import '../../product_info_page/product_info_page.dart';
import 'discount_widget.dart';

class InstanceWidget extends StatefulWidget {
  final ElementOfInstance data;
  final Function function;
  const InstanceWidget({Key? key, required this.data, required this.function})
      : super(key: key);
  @override
  State<InstanceWidget> createState() => InstanceWidgetState();
}

class InstanceWidgetState extends State<InstanceWidget> {

  static bool checkDiscount = true;

  void chooseProduct() {
    setState(() {
      if (!Data.selectedProducts.contains(widget.data)) {
        Data.selectedProducts.add(widget.data);
        ElementOfInstance.show(Data.selectedProducts);
        widget.data.color = ColorsApp.colorChoose;
        print("+");
      } else {
        Data.selectedProducts.remove(widget.data);
        print("-");
        ElementOfInstance.show(Data.selectedProducts);
        widget.data.color = ColorsApp.colorNoChoose;
      }
      /*final navigator = Navigator.of(context);
      navigator.push(
        MaterialPageRoute<void> (builder:(context) => ProductInfo(data: widget.data)),
      );*/
      widget.function();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? discount;
    if (checkDiscount) {
      discount = DiscountWidget(widget: widget);
    } else {
      discount = null;
    }
    return Container(
      width: 150,
      color: widget.data.color,
      child: InkWell(
        splashColor: ColorsApp.colorClick,
        onTap: () {
          chooseProduct();
        },
        child: Ink(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 200,
                height: 250,
                child: Column(children: [
                  Stack(
                    children: [
                      Image(
                        image: AssetImage(widget.data.image),
                      ),
                      Container(child: discount),
                      const Positioned(
                          right: 5,
                          top: 10,
                          child: Icon(
                            Icons.favorite,
                            color: ColorsApp.colorIconsFavorite,
                          )),
                    ],
                  ),
                  Text(widget.data.text, style: TextsStyle.productStyle),
                  const Text('(M,X,L,XL)',
                      style: TextStyle(color: ColorsApp.colorSizeTable)),
                  Text('${widget.data.count} \$', style: TextsStyle.countStyle),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
