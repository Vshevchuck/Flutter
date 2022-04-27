import 'package:flutter/material.dart';

const textStyle = TextStyle(
    color: Colors.black45,
    fontSize: 12,
    fontWeight: FontWeight.w400);

class ElementOfFunctional {
  final IconData icon;
  final String text;

  ElementOfFunctional(this.icon, this.text);
}

class FunctionalWidget extends StatelessWidget {
  final List<ElementOfFunctional> functionalRow;

  const FunctionalWidget({Key? key, required this.functionalRow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.5, bottom: 8,left: 15.0,right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: functionalRow.map((data) =>
              _FunctionalWigetColumn(data: data))
              .toList(),
        ),
    );
  }
}

class _FunctionalWigetColumn extends StatelessWidget {
  final ElementOfFunctional data;

  const _FunctionalWigetColumn({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Column(
        children: [
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(data.icon, color: Colors.black54,)
          ),
          const SizedBox(height: 2),
          Text(data.text,
              style:textStyle),
        ],
      ),
    );
  }
}