class Photocopies {
  final int amount;
  List<int> photocopyTime;
  Photocopies(this.amount, this.photocopyTime);

  void bubbleSort(List<int> photocopyTime) {
    int lengthOfArray = photocopyTime.length;
    for (int i = 0; i < lengthOfArray - 1; i++) {
      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        if (photocopyTime[j] < photocopyTime[j + 1]) {
          int temp = photocopyTime[j];
          photocopyTime[j] = photocopyTime[j + 1];
          photocopyTime[j + 1] = temp;
        }
      }
    }
  }

  int countTime(amount, photocopyTime) {
    int time = 0;
    int currentAmount = 0;
    bubbleSort(photocopyTime);
    var yourCopy = photocopyTime.toList();
    while (currentAmount < amount) {
      if (currentAmount == 0) {
        yourCopy[0] -= 1;
        if (yourCopy[0] == 0) {
          time++;
          currentAmount++;
          yourCopy[0] = photocopyTime[0];
        }
      } else {
        time++;
        for (int i = 0; i < photocopyTime.length; i++) {
          if (currentAmount+1 > i) {
            yourCopy[i] -= 1;
            if (yourCopy[i] == 0) {
              currentAmount++;
              yourCopy[i] = photocopyTime[i];
            }
            if (currentAmount >= amount) {
              break;
            }
          } else {
            i = 0;
            time++;
          }
        }

      }
    }
    return time;
  }

  get getTime => countTime(amount, photocopyTime);
}

void main() {
  Photocopies first = Photocopies(4, [1,1]);
  print(first.getTime);
  Photocopies second = Photocopies(5, [2,1]);
  print(second.getTime);
}
