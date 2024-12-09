import 'package:flutter/material.dart';


class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0"; // The current output on the screen
  String _input = ""; // The current expression

  // Function to handle button presses
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "=") {
        try {
          // Evaluate the expression when "=" is pressed
          _output = _calculate(_input);
          _input = _output; // Preserve the result as the input for next operations
        } catch (e) {
          _output = "Error";
        }
      } else if (buttonText == "C") {
        // Clear the input and output
        _output = "0";
        _input = "";
      } else {
        // Append the button's value to the input
        _input += buttonText;
        _output = _input;
      }
    });
  }

  // Function to evaluate the mathematical expression
  String _calculate(String expression) {
    try {
      // This is a simple evaluator using the `dart:math` package
      final result = _evalExpression(expression);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  // Function to perform simple arithmetic evaluation (for now just basic eval)
  double _evalExpression(String expression) {
    // Here you could use a more advanced library for evaluating expressions.
    // We use simple eval with double.parse() for this example.
    return double.parse(expression);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Display the current output (calculation result)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          // The GridView layout for buttons
          Expanded(
            child: GridView.count(
              crossAxisCount: 4, // 4 buttons per row
              children: [
                // Create the buttons for digits and operations
                for (String button in [
                  "7", "8", "9", "/",
                  "4", "5", "6", "*",
                  "1", "2", "3", "-",
                  "C", "0", "=", "+",
                ])
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () => _buttonPressed(button),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        button,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
