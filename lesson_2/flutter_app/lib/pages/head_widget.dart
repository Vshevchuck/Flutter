import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/images/images_name.dart';
import 'package:flutter_app3/mechanics/counting.dart';
class HeadWidget extends StatefulWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  
  @override
  State<HeadWidget> createState() => HeadWidgetState();
}

class HeadWidgetState extends State<HeadWidget> {
  void updateCost(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        LogoCompanyWidget(),
        NumberOfPurchasesWidget(function: updateCost),
        AmountWidget(),
      ],
    );
  }
}

class AmountWidget extends StatefulWidget {
  const AmountWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<AmountWidget> createState() => _AmountWidgetState();
}

class _AmountWidgetState extends State<AmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      bottom: 10,
      child: Row(
        children: [
          Text('Total amount - ',
              style: TextStyle(fontWeight: FontWeight.w500)),
          Text('${Counting.totalCount}', style: TextStyle(fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
}

class NumberOfPurchasesWidget extends StatefulWidget {
  final Function function;
  const NumberOfPurchasesWidget({
    Key? key,required this.function,
  }) : super(key: key);

  @override
  State<NumberOfPurchasesWidget> createState() =>
      _NumberOfPurchasesWidgetState();
}

class _NumberOfPurchasesWidgetState extends State<NumberOfPurchasesWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      bottom: 0,
      child: Column(
        children: [
          Row(
            children: [
              Text('${Counting.amount}',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              IconButton(
                icon: Icon(Icons.add_shopping_cart_outlined),
                onPressed: () {
                  setState(() {
                    Counting.checkBuy();
                    widget.function();
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LogoCompanyWidget extends StatelessWidget {
  const LogoCompanyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Image(
        width: 120,
        height: 90,
        image: AssetImage(ImagesName.logo),
      ),
    );
  }
}
