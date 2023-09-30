import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:calculator/Logic/calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorLogic calculatorLogic = CalculatorLogic();
  Map<String, Color> buttonColorMap = {
    '7': Color(0xFF495057),
    '8': Color(0xFF495057),
    '9': Color(0xFF495057),
    '/': Colors.orange,
    '4': Color(0xFF495057),
    '5': Color(0xFF495057),
    '6': Color(0xFF495057),
    '*': Colors.orange,
    '1': Color(0xFF495057),
    '2': Color(0xFF495057),
    '3': Color(0xFF495057),
    '-': Colors.orange,
    '0': Color(0xFF495057),
    '.': Color(0xFF495057),
    '=': Colors.orange,
    '+': Colors.orange,
    'C': Colors.grey,
    '(': Colors.grey,
    ')': Colors.grey,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Calculator'),
      // ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      calculatorLogic.userInput,
                      style: TextStyle(fontSize: 34.0,
                        color: Colors.white,),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      calculatorLogic.result,
                      style: TextStyle(
                        fontSize: 52.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                buildButtonRow(['C', '(', ')', '/']),
                buildButtonRow(['7', '8', '9', '*']),
                buildButtonRow(['4', '5', '6', '-']),
                buildButtonRow(['1', '2', '3', '+']),
                buildButtonRow(['0', '.','=']),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    List<Widget> buttonWidgets = buttons.map((text) {
      return Expanded(
        flex: text == '0' ? 2 : 1,
        child: CalculatorButton(
          text: text,
          onPressed: () {
            setState(() {
              if (text == '=') {
                calculatorLogic.onEqualsPress();
              } else if (text == 'C') {
                calculatorLogic.onClearPress();
              } else {
                calculatorLogic.onButtonPress(text);
              }
            });
          },
          color: buttonColorMap[text] ?? Colors.grey,
        ),
      );
    }).toList();

    return Row(
      children: buttonWidgets,
    );
  }
}
class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  CalculatorButton({
    required this.text,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(40.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

