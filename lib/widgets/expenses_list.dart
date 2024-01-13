import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_expanses/models/expenses.model.dart';
import 'package:personal_expanses/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.registeredExpenses,
      required this.deleteExpanse,
      super.key});
  final List<Expense> registeredExpenses;
  final void Function(Expense) deleteExpanse;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registeredExpenses.length,
      itemBuilder: (context, index) => Dismissible(
        // the delete function musty take the same key passed , so Flutter could track the changes , do not pass INDEX
        key: ValueKey(registeredExpenses[index]),
        child: ExpensesItem(item: registeredExpenses[index]),
        onDismissed: (direction) {
          deleteExpanse(registeredExpenses[index]);
        },
      ),
    );
  }
}
