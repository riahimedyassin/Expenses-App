import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/models/expenses.model.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  late final DateTime? _date;
  String dateString = 'Select a date';
  ExpenseCategory _selectedCategory = ExpenseCategory.games;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _priceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                maxLength: 50,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add),
                    label: Text("Enter the expense name")),
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: _selectedCategory,
                  items: ExpenseCategory.values.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toString()),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        if (value != null) _selectedCategory = value;
                      },
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.price_change_outlined),
                          label: Text("Price")),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(dateString),
                        IconButton(
                          onPressed: () async {
                            final firstDate = DateTime(DateTime.now().year - 1);
                            final lastDate = DateTime(DateTime.now().year + 1);
                            final DateTime? selectedDate = await showDatePicker(
                              context: context,
                              firstDate: firstDate,
                              lastDate: lastDate,
                            );
                            setState(() {
                              if (selectedDate == null) return;
                              _date = selectedDate;
                              dateString =
                                  DateFormat.yMMMMd().format(_date!).toString();
                            });
                          },
                          icon: const Icon(Icons.date_range),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      log(_titleController.text);
                      log(_priceController.text);
                    },
                    child: const Text(
                      'Save Expense',
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
