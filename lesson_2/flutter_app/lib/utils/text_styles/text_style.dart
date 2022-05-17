import 'package:flutter/material.dart';
abstract class TextsStyle {
  static const backTextStyle= TextStyle(color: Colors.black54,fontSize: 16);
  static const buyAllTextStyle = TextStyle(color: Colors.black54,fontSize: 16);
  static const cancelTextStyle = TextStyle(color: Colors.black54,fontSize: 16);
  static const emptyBasketTextStyle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black54);
  static const putAwayTextStyle = TextStyle(
      color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w200);
  static const buyOneTextStyle = TextStyle(
      color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w200);
  static const sumStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black);
  static const totalAmountStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black);
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
