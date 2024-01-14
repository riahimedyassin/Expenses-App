import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateTime = DateFormat.yMMMMd();

enum ExpenseCategory {
  food,
  games,
  school,
  travel;
}

const categoryIcon = {
  ExpenseCategory.food: Icons.food_bank,
  ExpenseCategory.games: Icons.gamepad,
  ExpenseCategory.travel: Icons.travel_explore,
  ExpenseCategory.school: Icons.school,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  String get formatedDate {
    return dateTime.format(date);
  }
}

class ExpensePocket {
  const ExpensePocket(this.expenses, this.category);
  ExpensePocket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((element) => element.category == category)
            .toList();

  final ExpenseCategory category;
  final List<Expense> expenses;
  double get totalExpenses {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
