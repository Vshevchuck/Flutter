import 'package:flutter/material.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/pages/logo_company_widget.dart';
import 'package:flutter_app3/pages/amount_widget.dart';
import 'package:flutter_app3/pages/number_of_purchases_widget.dart';
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
        const LogoCompanyWidget(),
        NumberOfPurchasesWidget(function: updateCost),
         AmountWidget(),
      ],
    );
  }
}





