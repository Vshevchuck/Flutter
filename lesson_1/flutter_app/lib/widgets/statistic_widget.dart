import 'package:flutter/material.dart';

const amountTextStyle = TextStyle(color: Colors.white, fontSize: 17);
const textTextStyle = TextStyle(
    color: Colors.white70,
    fontSize: 10,
    fontWeight: FontWeight.w400);

class InfoStatisticWidget extends StatelessWidget {
  final List<ElementOfStatistics> statisticColoumn;

  const InfoStatisticWidget({Key? key, required this.statisticColoumn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0,right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children:
        statisticColoumn.map((data) => _StatisticWidgetColumn(data: data))
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text(
            data.amount.toString(),
            style: amountTextStyle,
          ),
          const SizedBox(width: 15),
          Text(data.text,
              style:textTextStyle),
        ],
      ),
    );
  }
}
