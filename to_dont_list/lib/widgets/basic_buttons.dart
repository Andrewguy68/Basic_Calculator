import 'package:flutter/material.dart';
typedef CalculatorCallback = Function(String value);
class CalculatorButtons extends StatelessWidget {
    final CalculatorCallback onButtonPressed;
    const CalculatorButtons({
        super.key,
        required this.onButtonPressed,
});

    Widget buildButton(String buttonText){
        return SizedBox(
            width: 80,
            height: 60,
            child: ElevatedButton(
                onPressed: () => onButtonPressed(buttonText),
                child: Text(buttonText, style: const TextStyle(fontSize: 24)),
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: [
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('0'),
                buildButton('+'),
                buildButton('-'),
                buildButton('='),
                buildButton('C'),
            ],
        );
    }
}