import 'dart:io';

import 'package:flutter/material.dart';
class EnergyCount {
  final int numberOfPlatforms;
  List<int> platformsElevation = [];
  EnergyCount(this.numberOfPlatforms, this.platformsElevation);

  int countAllEnergy(List<int> platformsElevation,int numberOfPlatforms) {
    if (validate(numberOfPlatforms, platformsElevation)) {
      int totalEnergy = 0;
      while (platformsElevation.length != 1) {
        if (platformsElevation.length > 2) {
          if (superStep(platformsElevation) >
              step(platformsElevation) + step(platformsElevation)) {
            totalEnergy += step(platformsElevation);
            platformsElevation.removeAt(0);
            totalEnergy += step(platformsElevation);
          } else {
            totalEnergy += superStep(platformsElevation);
          }
        } else {
          totalEnergy += step(platformsElevation);
        }
        platformsElevation.removeAt(0);
      }
      return totalEnergy;
    } else
      return -1;
  }

  bool validate(int numberOfPlatforms, List<int>platformsElevation) {
    if (numberOfPlatforms != platformsElevation.length) {
      print('the number of platforms does not match the number of heights');
      return false;
    } else {
      if (numberOfPlatforms <= 1 && numberOfPlatforms >= 30000) {
        print('wrong number of platforms');
        return false;
      }
    }
    for (int pl in platformsElevation) {
      if (pl > 30000) {
        print('incorrect platform height');
      }
    }
    return true;
  }

  int superStep(List<int> platformsElevation) {
    int currentEnergy = 0;
    if (platformsElevation.length > 2) {
      if (3 * (platformsElevation[2] - platformsElevation[0]) > 0) {
        currentEnergy += 3 * (platformsElevation[2] - platformsElevation[0]);
      }
      return currentEnergy;
    } else
      return -1;
  }

  int step(List<int> platformsElevation) {
    int currentEnergy = 0;
    if (platformsElevation.length > 1) {
      if (platformsElevation[1] - platformsElevation[0] > 0) {
        currentEnergy += platformsElevation[1] - platformsElevation[0];
      }
    }
    return currentEnergy;
  }

  int get getEnergy => countAllEnergy(platformsElevation,numberOfPlatforms);
}

void main() {
  EnergyCount newWorld = EnergyCount(3, [1, 5, 150]);
  print(newWorld.getEnergy);
}







