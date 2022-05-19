import 'package:flutter/material.dart';
import '../colors/colors.dart';

class ElementOfInstance {
  final int count;
  final int discount;
  final String text;
  final String image;
  Color color = ColorsApp.colorNoChoose;
  int amount = 0;

  ElementOfInstance(this.count, this.discount, this.text, this.image);
}