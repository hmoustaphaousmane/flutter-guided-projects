import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work as String,
    ),
    Expense(
      title: 'Ciname',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leasure as String,
    ),
    Expense(
      title: 'Chawarma',
      amount: 11.39,
      date: DateTime.now(),
      category: Category.food as String,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpenseList(expenses: _registredExpenses),
          )
        ],
      ),
    );
  }
}
