import 'package:flutter/material.dart';
import 'expense_list/expense_list.dart';
import 'package:expense_tracker_omar/models/expense.dart';
import 'new_expense.dart';
import 'chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
        title: 'travel to turkey',
        amount: 560,
        dateTime: DateTime.now(),
        category: Category.cinema),
    Expense(
        title: 'travel to turkey',
        amount: 360,
        dateTime: DateTime.now(),
        category: Category.food),
  ];

  void addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void deleteExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  void addShowModalBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: addShowModalBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(
            allExpenses: expenses,
          ),
          ExpenseList(
            expenses: expenses,
            removeExpense: deleteExpense,
          ),
        ],
      ),
    );
  }
}
