import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/logo_company_widget.dart';
import 'package:flutter_app3/main_page/widgets/amount_widget.dart';
import 'package:flutter_app3/main_page/widgets/number_of_purchases_widget.dart';

class HeadWidget extends StatefulWidget {
  final Function callBack;
  const HeadWidget({
    Key? key, required this.callBack
  }) : super(key: key);

  @override
  State<HeadWidget> createState() => HeadWidgetState();
}

class HeadWidgetState extends State<HeadWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        const LogoCompanyWidget(),
        NumberOfPurchasesWidget(callBack : widget.callBack),
        // ignore: prefer_const_constructors
        AmountWidget(),
      ],
    );
  }
}
