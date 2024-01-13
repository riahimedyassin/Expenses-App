import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:personal_expanses/add_expense.dart';
import 'package:personal_expanses/models/expenses.model.dart';
import 'package:personal_expanses/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Hola",
        amount: 20,
        date: DateTime.now(),
        category: ExpenseCategory.games),
    Expense(
        title: "Hola",
        amount: 20,
        date: DateTime.now(),
        category: ExpenseCategory.food),
    Expense(
        title: "Hola",
        amount: 20,
        date: DateTime.now(),
        category: ExpenseCategory.travel),
  ];
  void addExpense(Expense e) {
    setState(() {
      _registeredExpenses.add(e);
    });
  }

  void deleteExpanse(Expense e) {
    setState(() {
      _registeredExpenses.remove(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Expenses App"),
            backgroundColor: Colors.indigo.shade300,
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (c) {
                        return AddExpense(
                          addExpense: addExpense,
                        );
                      });
                },
                icon: const Icon(
                  Icons.add,
                ),
              )
            ]),
        body: ExpensesList(
            registeredExpenses: _registeredExpenses,
            deleteExpanse: deleteExpanse));
  }
}
