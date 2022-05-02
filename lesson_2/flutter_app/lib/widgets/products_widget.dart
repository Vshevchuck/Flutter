import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app3/images/images_name.dart';
import 'package:flutter_app3/mechanics/counting.dart';
import 'package:flutter_app3/widgets/head_widget.dart';

class ElementOfInstance {
  final int count;
  final int discount;
  final String text;
  final String image;

  ElementOfInstance(this.count, this.discount, this.text, this.image);
}

class InstanceRowWidget extends StatefulWidget {
  final List<ElementOfInstance> instanceRow;
  final Function function;
  const InstanceRowWidget({Key? key, required this.instanceRow,required this.function})
      : super(key: key);

  @override
  State<InstanceRowWidget> createState() => _InstanceRowWidgetState();
}

class _InstanceRowWidgetState extends State<InstanceRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      children:
        widget.instanceRow.map((data) => InstanceWidget(data: data, function: widget.function)).toList(),
      );
  }
}

class InstanceWidget extends StatefulWidget {
  final ElementOfInstance data;
  final Function function;

  const InstanceWidget({Key? key, required this.data, required this.function})
      : super(key: key);

  @override
  State<InstanceWidget> createState() => _InstanceWidgetState();
}

class _InstanceWidgetState extends State<InstanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: GestureDetector(
        onTap: () {
          setState(() {
            Counting.buyOne(widget.data.count);
            Counting.countOne();
            widget.function();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200,
              height: 260,
              child: Column(children: [
                Stack(
                  children: [
                    Image(
                      image: AssetImage(widget.data.image),
                    ),
                    Positioned(
                      left: 5,
                      top: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Text(
                              '${widget.data.discount} %',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            color: Colors.red),
                      ),
                    ),
                    Positioned(
                        right: 5,
                        top: 10,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white54,
                        )),
                  ],
                ),
                Text('${widget.data.text}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                Text('(M,X,L,XL)', style: TextStyle(color: Colors.grey)),
                Text('${widget.data.count} \$',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
