import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expanses/models/expenses.model.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({required this.addExpense, super.key});
  final void Function(Expense) addExpense;
  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime _date = DateTime.now();
  String dateString = 'Select a date';
  ExpenseCategory _selectedCategory = ExpenseCategory.games;
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _priceController.dispose();
  }

  bool isValidData() {
    final double? price = double.tryParse(_priceController.text);
    final String title = _titleController.text;
    final DateTime date = _date;
    final ExpenseCategory category = _selectedCategory;
    return !(price == null || price < 0 || title.trim().isEmpty);
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
                  style: Theme.of(context).inputDecorationTheme.labelStyle,
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
                                initialDate: DateTime.now());
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
                      if (!isValidData()) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                title: Text(
                                  "Invalid Data",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                icon: const Icon(Icons.error),
                                content: const Text(
                                  "Please verify the data you entered",
                                  style: TextStyle(color: Colors.black),
                                ),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                          },
                                          child: const Text("Go back"))
                                    ],
                                  )
                                ],
                              );
                            });
                      } else {
                        Expense e = Expense(
                          title: _titleController.text,
                          amount: double.parse(_priceController.text),
                          date: _date,
                          category: _selectedCategory,
                        );
                        widget.addExpense(e);
                        Navigator.pop(context);
                      }
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
