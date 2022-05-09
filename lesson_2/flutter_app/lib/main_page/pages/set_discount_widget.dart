import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/pages/instance_widget.dart';

class SetDiscountWidget extends StatelessWidget {
  final Function function;
  const SetDiscountWidget({
    Key? key,required this.function
  }) : super(key: key);
  static bool isSwitched = true;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
        InstanceWidgetState.checkDiscount=true;
        isSwitched = true;
        function();
    } else {
        InstanceWidgetState.checkDiscount=false;
        isSwitched = false;
        function();
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
