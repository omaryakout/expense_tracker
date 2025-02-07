import 'package:flutter/material.dart';
import 'package:expense_tracker_omar/widgets/expenses.dart';

void main() {
  var kColorScheme =
      ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 91, 13, 147));

  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      useMaterial3: true,
      appBarTheme: AppBarTheme().copyWith(
        backgroundColor: kColorScheme.primary,
      ),
      cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
     
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            textStyle: const TextStyle(color: Colors.white)),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
    ),
    home: Expenses(),
  ));
}
