// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/operations.dart';
import 'package:to_dont_list/widgets/basic_buttons.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  final List<Item> items = [];
  String displayText = "";
  String currentText = "";
  final Operation operation = Operation();

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        displayText = "";
        currentText = "";
        operation.clear();

      } else if (value == '+' || value == '-') {
        if (currentText.isNotEmpty) {
          operation.addNumber(int.tryParse(currentText) ?? 0);
          operation.addOperation(value);
          displayText += value;
          currentText = "";
        }

      } else if (value == '=') {
        if (currentText.isNotEmpty) {
          operation.addNumber(int.tryParse(currentText) ?? 0);
          operation.addOperation(value);
          int answer = operation.calculate();
          items.insert(0, Item(name: "$displayText = $answer"));
          currentText += answer.toString();
          displayText += "= $answer";
          operation.clear();
        }
    
      // When a user changes what's in the list, you need
      // to change _itemSet inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.
      } else {
        currentText += value;
        displayText += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Basic Calculator"),
    ),
    body: Padding(padding: const EdgeInsets.all(12.0),
    child: Column(children: [
      TextField(readOnly: true, 
      controller: TextEditingController(text: displayText),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      ),
      const SizedBox(height: 20.0),
      CalculatorButtons(onButtonPressed: _buttonPressed,
      ),
      const SizedBox(height: 20.0),
      const Text("Calculation History", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      Expanded(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].name),
            );
          },
        ),
      ),
    ],
    ),
    ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Calculator',
    home: CalculatorApp(),
  ));
}
