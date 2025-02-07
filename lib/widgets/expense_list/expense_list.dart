import 'package:flutter/material.dart';
import 'expense_item.dart';
import 'package:expense_tracker_omar/models/expense.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses, required this.removeExpense});
  final List<Expense> expenses;
  void Function(Expense expense) removeExpense;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Dismissible(
                  key: ValueKey(expenses[index]),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    removeExpense(expenses[index]);
                  },
                  child: ExpenseItem(expense: expenses[index]))
            ],
          );
        },
      ),
    );
  }
}
// class ExpensesList extends StatelessWidget {
//   const ExpensesList({
//     super.key,
//     required this.expenses,
//     required this.onRemoveExpense,
//   });

//   final List<Expense> expenses;
//   final void Function(Expense expense) onRemoveExpense;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: expenses.length,
//       itemBuilder: (ctx, index) => Dismissible(
//         key: ValueKey(expenses[index]),
//         background: Container(
//           color: Theme.of(context).colorScheme.error.withOpacity(0.75),
//           margin: EdgeInsets.symmetric(
//             horizontal: Theme.of(context).cardTheme.margin!.horizontal,
//           ),
//         ),
//         onDismissed: (direction) {
//           onRemoveExpense(expenses[index]);
//         },
//         child: ExpenseItem(
//           expenses[index],
//         ),
//       ),
//     );
//   }
// }
