import 'dart:io';

import 'package:flutter/material.dart';
class StonePile {
  final int amount;
  List<int> heap = [];
  StonePile(this.amount, this.heap);
  void bubbleSort(List<int> heap) {
    int lengthOfArray = heap.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (heap[j] < heap[j + 1]) {
          int temp = heap[j];
          heap[j] = heap[j + 1];
          heap[j + 1] = temp;
        }
      }
    }
  }

  bool validate(int amount, List<int> heap) {
    if (amount != heap.length) {
      print('the number of stones does not match the number of the weight');
      return false;
    } else {
      if (amount < 1 && amount > 18) {
        print('wrong number of stones');
        return false;
      }
    }
    for (int pl in heap) {
      if (pl < 1) {
        print('incorrect stones weights');
      }
    }
    return true;
  }

  int separationHeap(List<int> heap) {
    bubbleSort(heap);
    if (validate(amount, heap)) {
      int left = 0;
      int right = 0;
      for (int i = 0; i < heap.length; i++) {
        if (left <= right) {
          left += heap[i];
        } else
          right += heap[i];
      }
      if (left <= right) {
        return right - left;
      } else
        return left - right;
    }
    return -1;
  }

  int get getDifference => separationHeap(heap);
}

void main() {
  StonePile piles = StonePile(3, [5, 8, -1, 27, 14]);
  print(piles.getDifference);
}


