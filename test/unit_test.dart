
import 'package:flutter_test/flutter_test.dart';
import 'package:practice_dart/test_business_login.dart';

void main() {
  /*group('Fixed Test', () {
    test("Testing for []", () {
      expect(BusinessLogin().doSomeProcess([]), equals([]));
    });
    test("Testing for [1, 2, 3]", () {
      expect(BusinessLogin().doSomeProcess([1, 2, 3]), equals([2, 4, 6]));
    });
    test("Testing for [4, 6, 7, 1, 3]", () {
      expect(BusinessLogin().doSomeProcess([4, 6, 7, 1, 3]), equals([5, 8, 0, 5, 8]));
    });
    test("Testing for [3, 6, 9, 8, 9]", () {
      expect(BusinessLogin().doSomeProcess([3, 6, 9, 8, 9]), equals([4, 8, 2, 2, 4]));
    });
    test("Testing for [1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 9, 9, 9, 8]", () {
      expect(BusinessLogin().doSomeProcess([1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 9, 9, 9, 8]), equals([2, 4, 6, 8, 0, 2, 4, 6, 8, 9, 0, 1, 2, 2]));
    });
  });*/
  /*group('Even Odd Test', () {
    test("Testing [1, 1]", () {
      expect(BusinessLogin().oddOrEven([1, 1]), equals("even"));
    });

    test("Testint [1, 3]", () {
      expect(BusinessLogin().oddOrEven([1, 3]), equals("even"));
    });

    test("Testing [-2, 3]", () {
      expect(BusinessLogin().oddOrEven([-2, 3]), equals("odd"));
    });

    test("Testing [-2, 2]", () {
      expect(BusinessLogin().oddOrEven([-2, 2]), equals("even"));
    });

    test("Testing [-2, 99, 99]", () {
      expect(BusinessLogin().oddOrEven([-2, 99, 99]), equals("even"));
    });

    test("Testing [-100, 99]", () {
      expect(BusinessLogin().oddOrEven([-100, 99]), equals("odd"));
    });

    test("Testing [17, 21, 99]", () {
      expect(BusinessLogin().oddOrEven([17, 21, 99]), equals("odd"));
    });

    test("Testing [-2, 2, 9, 8, 3]", () {
      expect(BusinessLogin().oddOrEven([-2, 2, 9, 8, 3]), equals("even"));
    });
  });*/

  /*group('Extract First Letter', () {
    test('Testing 1', () {
      expect(BusinessLogin().extractFirstLetterWithSpacing('Hello World!'), equals('H W'));
    });
    test('Testing 2', () {
      expect(BusinessLogin().extractFirstLetterWithSpacing('Mohamed Anas Resavu Mydeen'), equals('M A R M'));
    });
    test('Testing 3', () {
      expect(BusinessLogin().extractFirstLetterWithSpacing('Anas Shabira Minnah Ahsan'), equals('A S M A'));
    });
  });*/
  group('Vowels Test', () {
    test('Test 1', () {
      expect(BusinessLogin().checkVowels('h'), equals('consonant'));
    });
    test('Test 2', () {
      expect(BusinessLogin().checkVowels('a'), equals('vowels'));
    });
    test('Test 3', () {
      expect(BusinessLogin().checkVowels('z'), equals('consonant'));
    });
  });
}