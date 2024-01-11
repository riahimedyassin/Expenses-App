import 'dart:developer';

import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final _titleController = TextEditingController();

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
                    label: Text("Enter the expense name")),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      log(_titleController.text);
                    },
                    child: const Text(
                      'Display value',
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
  }
}
