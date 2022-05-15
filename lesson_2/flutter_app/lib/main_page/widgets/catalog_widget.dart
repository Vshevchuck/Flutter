import 'package:flutter/material.dart';

import 'package:flutter_app3/utils/text_styles/text_style.dart';
import 'package:flutter_app3/utils/colors/colors.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisSize : MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorsApp.colorBorderChooseCatalog,
                      width: 2.0,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Center(
                    child: Text('hoody',
                        style: TextsStyle.selectedCatalogStyle),
                  ),
                )),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text('jeans',
                    style: TextsStyle.catalogStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}