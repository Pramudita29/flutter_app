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
    "<-",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Display area
            TextFormField(
              textAlign: TextAlign.right,
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "0",
              ),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              readOnly: true,
            ),
            const SizedBox(height: 10),
            // Button Grid
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
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => _onButtonPressed(lstSymbols[index]),
                    child: Text(
                      lstSymbols[index],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getButtonColor(String symbol) {
    if (symbol == "C" || symbol == "<-") {
      return Colors.redAccent;
    } else if (["/", "*", "-", "+", "%", "="].contains(symbol)) {
      return Colors.blueAccent;
    } else {
      return Colors.amber;
    }
  }

  void _onButtonPressed(String symbol) {
    if (symbol == "C") {
      _textController.clear();
    } else if (symbol == "<-") {
      if (_textController.text.isNotEmpty) {
        _textController.text =
            _textController.text.substring(0, _textController.text.length - 1);
      }
    } else if (symbol == "=") {
      _calculateResult();
    } else {
      _textController.text += symbol;
    }
  }

  void _calculateResult() {
    try {
      final expression = _textController.text;
      // Evaluate the expression (you can replace this with a library if needed)
      final result = _evaluateExpression(expression);
      _textController.text = result.toString();
    } catch (e) {
      _textController.text = "Error";
    }
  }

  double _evaluateExpression(String expression) {
    return double.parse(expression);
  }
}
