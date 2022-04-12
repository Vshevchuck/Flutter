import 'dart:io';

import 'package:flutter/material.dart';
class ladder
{
  final int numberOfCubes;
  ladder(this.numberOfCubes);

  int buildLadder(int numberOfCubes,int currentLevelLadder){
    if(numberOfCubes<=currentLevelLadder)
    {
      return currentLevelLadder;
    }
    else
    {
      currentLevelLadder++;
      return buildLadder(numberOfCubes-currentLevelLadder,currentLevelLadder);
    }
  }

  int get showLadder =>  buildLadder(numberOfCubes,0);
}

void main() {
  ladder ld=ladder(6);
  print(ld.showLadder);
}



