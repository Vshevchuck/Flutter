import 'package:flutter/material.dart';
import 'package:flutter_app3/main_page/widgets/instance_widget.dart';

class SetDiscountWidget extends StatelessWidget {
  final Function callBack;
  const SetDiscountWidget({
    Key? key,required this.callBack
  }) : super(key: key);
  static bool isSwitched = true;
  void _toggleSwitch(bool value) {
    if (isSwitched == false) {
        InstanceWidgetState.checkDiscount=true;
        isSwitched = true;
        callBack();
    } else {
        InstanceWidgetState.checkDiscount=false;
        isSwitched = false;
        callBack();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Discount'),
        SizedBox(
          width: 35,
          height: 30,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Switch(
              value: isSwitched,
              onChanged: _toggleSwitch,
            ),
          ),
        )
      ],
    );
  }
}
