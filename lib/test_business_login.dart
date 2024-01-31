
import 'package:flutter/foundation.dart';

class TestBusinessLogic {

  Future<List<int>> doSomeProcess(List<int> nums) async {
    await Future.delayed(const Duration(seconds: 3));
    final List<int> modifiedNumbers = nums.map((e) => e + nums.indexOf(e)).toList();
    return modifiedNumbers;
  }

  Future<String> multiplicationTable(int factor) async{
    await Future.delayed(const Duration(seconds: 1));

    String tableString = '';

    for(int i=1; i<=20; i++) {
      final result = i * factor;
      if (kDebugMode) {
        tableString += '$i x $factor = $result\n';
      }
    }

    return tableString;
  }
}

class BusinessLogin {
  List<int> doSomeProcess(List<int> nums) {
    // final List<int> modifiedNumbers = nums.map((e) => (e + nums.indexOf(e)+1) %10 ).toList();
    // return modifiedNumbers;
    return nums.asMap().entries.map((e) => (e.value + e.key + 1) % 10).toList();
  }

  String oddOrEven(List<int> array) {
    final sumOfArray = array.reduce((value, element) => value + element);
    return sumOfArray % 2 == 0 ? 'even' : 'odd';
  }

  String checkEvenOdd(List<int> array) => array.reduce((value, element) => value + element).isEven ? 'even' : 'odd';

  String extractFirstLetterWithSpacing(String words) {

    final firstLetters = words.split(" ").map((e) {
      if(e.isNotEmpty) {
        return e[0];
      } else {
        return '';
      }
    }).join(" ");

    return firstLetters;
  }

  double findInterest(double p, double t, double r) {
    return (p * t * r) / 100;
  }

  String checkVowels(String input) {
    final vowels = ['a', 'e', 'i', 'o', 'u'];
    if (vowels.contains(input)) {
      return 'vowels';
    } else {
      return 'consonant';
    }
  }

  void multiplicationTable(int factor) {
    for(int i=1; i<=10; i++) {
      final result = i * 5;
      if (kDebugMode) {
        print('$i x $factor = $result');
      }
    }
  }

}