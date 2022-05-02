import 'package:flutter/material.dart';

class Counting {
  static int count=450;
  static int totalCount = 0;
  static int amount = 0;
  static  buyOne() {
    return totalCount += count;
  }
  static countOne() {
    return amount++;
  }
  static checkBuy(){
    totalCount=0;
    amount=0;
  }
}
