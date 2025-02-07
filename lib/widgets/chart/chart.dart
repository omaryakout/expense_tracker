import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expense_tracker_omar/models/expense.dart';
import 'char_bar.dart';

class Chart extends StatelessWidget {
  Chart({super.key, required this.allExpenses});
  final List<Expense> allExpenses;
  

  List<ExpenseBucket> get specifiedExpenses {
    return [
      ExpenseBucket.forCategory(
        allExpenses,
        Category.cinema,
        'cinema'
      ),
      ExpenseBucket.forCategory(allExpenses, Category.food,'food'),
      ExpenseBucket.forCategory(allExpenses, Category.fun,'fun'),
      ExpenseBucket.forCategory(allExpenses, Category.tax,'tax'),
    ];
  }

  double get maxExpense {
    double maxExpense = 0;
    for (var expense in specifiedExpenses) {
      if (expense.sumExpenses > maxExpense) {
        maxExpense = expense.sumExpenses;
      }
    }
    return maxExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (var expense in specifiedExpenses)
                  ChartBar(
                      fill: maxExpense == 0
                          ? 0
                          : expense.sumExpenses / maxExpense),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var cat in specifiedExpenses)
                Expanded(

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(cat.title),
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              for (var cat in specifiedExpenses)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(categoryIcons[cat.category]),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
