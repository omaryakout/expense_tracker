import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, fun, tax, cinema }

const categoryIcons = {
  Category.cinema: Icons.movie,
  Category.food: Icons.food_bank,
  Category.fun: Icons.flight,
  Category.tax: Icons.monetization_on
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category});
  // : id = uuid.v4()
  final String title;
  final double amount;
  final DateTime dateTime;
  // final String id;
  final Category category;

  String get formattedDate {
    return formatter.format(dateTime);
  }
}

class ExpenseBucket {
  ExpenseBucket(
      {required this.category,
      required this.specifiedExpenses,
      required this.title});
  final Category category;
  final List<Expense> specifiedExpenses;
  final String title;

  ExpenseBucket.forCategory(
      List<Expense> allExpenses, this.category, this.title)
      : specifiedExpenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  double get sumExpenses {
    double sum = 0;
    for (var expense in specifiedExpenses) {
      sum = expense.amount + sum;
    }
    return sum;
  }
}
