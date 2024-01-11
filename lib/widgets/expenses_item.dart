import 'package:flutter/material.dart';
import 'package:personal_expanses/models/expenses.model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({required this.item, super.key});
  final Expense item;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              Text(item.title),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "${item.amount.toStringAsFixed(2)} \$",
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      Text(item.formatedDate)
                    ],
                  ),
                  const Spacer(),
                  Icon(categoryIcon[item.category])
                ],
              )
            ],
          ),
        ));
  }
}
