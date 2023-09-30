import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String userInput = '';
  String result = '';

  void onDigitPress(String digit) {
    userInput += digit;
  }

  void onOperatorPress(String operator) {
    if (userInput.isNotEmpty && !userInput.endsWith('.')) {
      userInput += operator;
    }
  }

  void onButtonPress(String buttonText) {
    if (buttonText == '(' || buttonText == ')') {
      // Handle parentheses input
      userInput += buttonText;
    } else {
      userInput += buttonText;
    }
  }

  void onEqualsPress() {
    try {
      // Replace '^' with '**' for exponentiation
      userInput = userInput.replaceAll('^', '**');
      Parser p = Parser();
      Expression exp = p.parse(userInput);
      ContextModel cm = ContextModel();
      double evalResult = exp.evaluate(EvaluationType.REAL, cm);
      result = evalResult.toString();
    } catch (e) {
      result = 'Error';
    }
  }


  void onClearPress() {
    userInput = '';
    result = '';
  }
}