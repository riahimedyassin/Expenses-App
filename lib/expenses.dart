import 'package:flutter/material.dart';
import 'package:personal_expanses/add_expense.dart';
import 'package:personal_expanses/chart/chart.dart';
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
        amount: 40,
        date: DateTime.now(),
        category: ExpenseCategory.food),
    Expense(
        title: "Hola",
        amount: 30,
        date: DateTime.now(),
        category: ExpenseCategory.travel),
    Expense(
        title: "Hola",
        amount: 50,
        date: DateTime.now(),
        category: ExpenseCategory.travel),
    Expense(
        title: "Hola",
        amount: 60,
        date: DateTime.now(),
        category: ExpenseCategory.food),
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
    final snackBar = SnackBar(
      content: const Text('Deleted successfully'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Code to undo the action
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Expenses App"), actions: [
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
      body: Center(
        child: width < 600
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesList(
                      registeredExpenses: _registeredExpenses,
                      deleteExpanse: deleteExpanse,
                    ),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesList(
                      registeredExpenses: _registeredExpenses,
                      deleteExpanse: deleteExpanse,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
