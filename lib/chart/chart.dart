import 'package:flutter/material.dart';
import 'package:personal_expanses/chart/chart_bar.dart';
import 'package:personal_expanses/models/expenses.model.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});
  final List<Expense> expenses;

  List<ExpensePocket> get buckets {
    return [
      ExpensePocket.forCategory(expenses, ExpenseCategory.food),
      ExpensePocket.forCategory(expenses, ExpenseCategory.travel),
      ExpensePocket.forCategory(expenses, ExpenseCategory.games),
      ExpensePocket.forCategory(expenses, ExpenseCategory.food)
    ];
  }

  get maxExpense {
    double maxExpense = 0;
    for (var b in buckets) {
      if (b.totalExpenses > maxExpense) maxExpense = b.totalExpenses;
    }
    return maxExpense;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary.withOpacity(0.3),
          Theme.of(context).colorScheme.primary.withOpacity(0),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final b in buckets)
                  ChartBar(fill: b.totalExpenses / maxExpense)
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: buckets
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      child: Icon(
                        categoryIcon[e.category],
                        color: !isDarkMode
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
