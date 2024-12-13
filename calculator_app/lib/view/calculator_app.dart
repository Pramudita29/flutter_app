import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _textController = TextEditingController();
  List<String> lstSymbols = [
    "C",
    "*",
    "/",
    "X",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "="
  ];

  String currentInput = "";
  String operation = "";
  double? firstOperand;

  void _handleInput(String symbol) {
    setState(() {
      if (symbol == "C") {
        // Clear the input
        _textController.text = "";
        currentInput = "";
        firstOperand = null;
        operation = "";
      } else if (symbol == "X") {
        // Backspace
        if (currentInput.isNotEmpty) {
          currentInput = currentInput.substring(0, currentInput.length - 1);
          _textController.text = currentInput;
        }
      } else if (symbol == "=") {
        // Calculate the result
        if (firstOperand != null &&
            operation.isNotEmpty &&
            currentInput.isNotEmpty) {
          double secondOperand = double.parse(currentInput);
          double result = 0;
          switch (operation) {
            case "+":
              result = firstOperand! + secondOperand;
              break;
            case "-":
              result = firstOperand! - secondOperand;
              break;
            case "*":
              result = firstOperand! * secondOperand;
              break;
            case "/":
              result = secondOperand != 0 ? firstOperand! / secondOperand : 0;
              break;
            case "%":
              result = firstOperand! % secondOperand;
              break;
          }
          _textController.text = result.toString();
          currentInput = result.toString();
          firstOperand = null;
          operation = "";
        }
      } else if (["+", "-", "*", "/", "%"].contains(symbol)) {
        // Handle operations
        if (currentInput.isNotEmpty) {
          firstOperand = double.parse(currentInput);
          operation = symbol;
          currentInput = "";
          _textController.text = symbol;
        }
      } else {
        // Append numbers or decimal point
        currentInput += symbol;
        _textController.text = currentInput;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pramudita Calculator App'),
        backgroundColor: Colors.teal, // AppBar color changed to Teal
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                readOnly: true,
                textDirection: TextDirection.rtl,
                controller: _textController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200], // Input field color
                ),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Input text color
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: lstSymbols.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getButtonColor(lstSymbols[index]),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                      ),
                      onPressed: () {
                        _handleInput(lstSymbols[index]);
                      },
                      child: Text(
                        lstSymbols[index],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Button text color
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(String symbol) {
    if (symbol == "C") {
      return Colors.redAccent; // Clear button color
    } else if (symbol == "=") {
      return Colors.green; // Equal button color
    } else if (["+", "-", "*", "/", "%"].contains(symbol)) {
      return Colors.orange; // Operator button color
    } else {
      return Colors.blue; // Default button color
    }
  }
}
