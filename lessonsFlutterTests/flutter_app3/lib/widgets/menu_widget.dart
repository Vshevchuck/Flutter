import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final List<ElementOfMenu> menuWidgetColumn;

  const MenuWidget({Key? key, required this.menuWidgetColumn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      //width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: menuWidgetColumn
            .map((data) => _MenuWidgetColumn(data: data))
            .toList(),
      ),
    );
  }
}

class ElementOfMenu {
  final IconData icon;
  final String text;
  final String text2;
  final Color color;

  ElementOfMenu(this.text2, this.text, this.icon, this.color);
}

class _MenuWidgetColumn extends StatelessWidget {
  final ElementOfMenu data;

  const _MenuWidgetColumn({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              offset: Offset(0, 1), // Shado
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: data.color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(
                      data.icon,
                      color: Colors.white,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.text2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    data.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black26,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Expanded(child: Text(" ")),
              Icon(Icons.arrow_forward_ios_outlined, color: Colors.black26,size:16)
            ],
          ),
        ),
      ),
    );
  }
}
