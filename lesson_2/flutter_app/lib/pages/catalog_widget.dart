import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisSize : MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Text('hoody',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20)),
                  ),
                )),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: Text('jeans',
                    style: TextStyle(
                        fontWeight: FontWeight.w200, fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}