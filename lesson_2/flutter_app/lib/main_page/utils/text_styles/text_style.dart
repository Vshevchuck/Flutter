import 'package:flutter/material.dart';

abstract class TextsStyle {
  static const totalAmountStyle = TextStyle(fontWeight: FontWeight.w500);
  static const selectedCatalogStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
  static const catalogStyle =
      TextStyle(fontWeight: FontWeight.w200, fontSize: 20);
  static const productStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w500);
  static const countStyle =
      TextStyle(color: Colors.red, fontWeight: FontWeight.w500);
  static const discountStyle =
      TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w300);
}
