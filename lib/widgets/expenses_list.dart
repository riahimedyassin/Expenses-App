import 'package:flutter/material.dart';
import 'package:personal_expanses/models/expenses.model.dart';
import 'package:personal_expanses/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.registeredExpenses,  super.key});
  final List<Expense> registeredExpenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (context, index) =>
          ExpensesItem(item: registeredExpenses[index]),
    );
  }
}
