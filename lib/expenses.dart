import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hola"),
          backgroundColor: Colors.indigo.shade300,
        ),
        body: Center(
            child: Expanded(
          child: ExpensesList(registeredExpenses: _registeredExpenses,)
          ),
        ));
  }
}
