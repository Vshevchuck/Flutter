import 'package:flutter/material.dart';
import 'package:flutter_app3/pages/instance_widget.dart';

class SetDiscountWidget extends StatefulWidget {
  final Function function;
  const SetDiscountWidget({
    Key? key,required this.function
  }) : super(key: key);
  @override
  State<SetDiscountWidget> createState() => _DiscountWidgetState();
}
class _DiscountWidgetState extends State<SetDiscountWidget> {
  static bool isSwitched = true;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        InstanceWidgetState.checkDiscount=true;
        isSwitched = true;
        widget.function();
      });
    } else {
      setState(() {
        InstanceWidgetState.checkDiscount=false;
        isSwitched = false;
        widget.function();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('discount'),
        SizedBox(
          width: 35,
          height: 30,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: isSwitched,
              onChanged: toggleSwitch,
            ),
          ),
        )
      ],
    );
  }
}
