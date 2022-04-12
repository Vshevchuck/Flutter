class PiggyBankCost {
  final int empty;
  final int full;
  final int number;
  Map<int, int> primeAndWeight = {};
  PiggyBankCost(this.empty, this.full, this.number, this.primeAndWeight);

  int getMinPrime(primeAndWeight) {
    int min = 100000;
    for (var k in primeAndWeight.keys) {
      if (min > k) {
        min = k;
      }
    }
    return min;
  }

  int getMaxPrime(primeAndWeight) {
    int max = 0;
    for (var k in primeAndWeight.keys) {
      if (max < k) {
        max = k;
      }
    }
    return max;
  }

  int getMinCount(primeAndWeight) {
    if (validate(empty, full, number, primeAndWeight)) {
      int currentWeight = 0;
      int count = 0;
      int min = getMinPrime(primeAndWeight);
      int max = getMaxPrime(primeAndWeight);
      while (currentWeight < full - empty) {
        int a = primeAndWeight[min];
        currentWeight += a;
        count += min;
        if (currentWeight > full - empty && primeAndWeight.length > 1) {
          count -= min;
          int a = primeAndWeight[min];
          currentWeight -= a;
          a = primeAndWeight[max];
          currentWeight += a;
          count += max;
        }
      }
      if (currentWeight == full - empty) {
        return count;
      } else {
        print('this is immossible');
      }
      return -1;
    } else
      return -1;
  }

  int getMaxCount(primeAndWeight) {
    if (validate(empty, full, number, primeAndWeight)) {
      int currentWeight = 0;
      int count = 0;
      int min = getMinPrime(primeAndWeight);
      int max = getMaxPrime(primeAndWeight);
      while (currentWeight < full - empty) {
        int a = primeAndWeight[max];
        currentWeight += a;
        count += max;
        if(currentWeight + primeAndWeight[max] > full - empty) {
          count -= max;
          int a = primeAndWeight[max];
          currentWeight -= a;
          a = primeAndWeight[min];
          currentWeight += a;
          count += min;
        }
        // print("$count $currentWeight");
      }
      if (currentWeight == full - empty) {
        return count;
      } else {
        print('this is immossible');
      }
      return -1;
    }

    return -1;
  }

  bool validate(empty, full, number, primeAndWeight) {
    if (empty < 1 && empty > 10000 && full < 1 && full > 10000) {
      return false;
    }
    if (number < 1 && number > 500) {
      return false;
    }
    for (var k in primeAndWeight.keys) {
      if (k < 1 && k > 50000) {
        return false;
      }
    }
    for (var v in primeAndWeight.values) {
      if (v < 1 && v > 10000) {
        return false;
      }
    }
    return true;
  }

  get getCount =>
      print('${getMinCount(primeAndWeight)} ${getMaxCount(primeAndWeight)}');
}

void main() {

  PiggyBankCost second = PiggyBankCost(1000, 1010, 2, {6: 3, 2: 2});
  second.getCount;

  PiggyBankCost first = PiggyBankCost(1000, 1100, 2, {1: 1, 5: 2});
  first.getCount;

  PiggyBankCost third = PiggyBankCost(1000, 1100, 1, {10: 3});
  third.getCount;
}
