// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_dont_list/main.dart';

void main() {
  testWidgets('Calculator runs', (tester) async{
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));
    //arrange
    expect(find.text('Basic Calculator'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text("1"), findsOneWidget);
    expect(find.text("2"), findsOneWidget);
    expect(find.text("3"), findsOneWidget);
    expect(find.text("4"), findsOneWidget);
    expect(find.text("5"), findsOneWidget);
    expect(find.text("6"), findsOneWidget);
    expect(find.text("7"), findsOneWidget);
    expect(find.text("8"), findsOneWidget);
    expect(find.text("9"), findsOneWidget);
    expect(find.text("0"), findsOneWidget);
    expect(find.text("+"), findsOneWidget);
    expect(find.text("-"), findsOneWidget);
    expect(find.text("="), findsOneWidget);
    expect(find.text("C"), findsOneWidget);
  });

  testWidgets('Addition Works', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));

    await tester.tap(find.text('1'));
    await tester.pump(); // Pump after every action to rebuild the widgets

    await tester.tap(find.text('+'));
    await tester.pump();

    await tester.tap(find.text('2'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    final textfield = tester.widget<TextField>(find.byType(TextField));
    expect(textfield.controller?.text, equals('3'));
  });

  testWidgets('Subtraction Works', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));

    await tester.tap(find.text('3'));
    await tester.pump(); // Pump after every action to rebuild the widgets

    await tester.tap(find.text('-'));
    await tester.pump();

    await tester.tap(find.text('2'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    final textfield = tester.widget<TextField>(find.byType(TextField));
    expect(textfield.controller?.text, equals('1'));
  });

  testWidgets('History Works', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CalculatorApp()));

    await tester.tap(find.text('1'));
    await tester.pump(); // Pump after every action to rebuild the widgets

    await tester.tap(find.text('+'));
    await tester.pump();

    await tester.tap(find.text('2'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.text('1 + 2 = 3'), findsOneWidget);
  });

  // One to test the tap and press actions on the items?
}
