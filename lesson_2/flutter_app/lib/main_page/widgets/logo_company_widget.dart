import 'package:flutter/material.dart';
import 'package:flutter_app3/utils/images/images_name.dart';

class LogoCompanyWidget extends StatelessWidget {
  const LogoCompanyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topCenter,
      child: Image(
        width: 110,
        height: 80,
        image: AssetImage(ImagesName.logo),
      ),
    );
  }
}