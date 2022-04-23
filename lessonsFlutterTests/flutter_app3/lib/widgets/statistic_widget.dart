import 'package:flutter/material.dart';

final amountTextStyle = TextStyle(color: Colors.white, fontSize: 17);
final textTextStyle = TextStyle(
    color: Colors.white70,
    fontSize: 10,
    fontWeight: FontWeight.w400);

class InfoStatisticWidget extends StatelessWidget {
  final List<ElementOfStatistics> StatisticColoumn;

  const InfoStatisticWidget({Key? key, required this.StatisticColoumn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      //width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:
        StatisticColoumn.map((data) => _StatisticWidgetColumn(data: data))
            .toList(),
      ),
    );
  }
}

class ElementOfStatistics {
  final int amount;
  final String text;

  ElementOfStatistics(this.amount, this.text);
}

class _StatisticWidgetColumn extends StatelessWidget {
  final ElementOfStatistics data;

  const _StatisticWidgetColumn({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text(
            data.amount.toString(),
            style: amountTextStyle,
          ),
          SizedBox(width: 15),
          Text(data.text,
              style:textTextStyle),
        ],
      ),
    );
  }
}
