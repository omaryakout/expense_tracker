import 'package:flutter/material.dart';
import 'package:expense_tracker_omar/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text("\$${expense.amount}"),
                const Spacer(),
                Icon(categoryIcons[expense.category]),
                Text(expense.formattedDate)
              ],
              
            ),
          ],
        ),
      ),
    );
  }
}
