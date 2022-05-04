import 'package:flutter/material.dart';

class Counting {
  final  int count;
  static int totalCount = 0;
  static int amount = 0;
  Counting(this.count);
  static buyOne(int count) {
    return totalCount += count;
  }
  static countOne() {
    return amount++;
  }
  static deleteOne(int count) {
    return totalCount -= count;
  }
  static discountOne() {
    return amount--;
  }
  static checkBuy(){
    totalCount=0;
    amount=0;
  }
}
