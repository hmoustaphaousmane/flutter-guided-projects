import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

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
    return const Scaffold(
      body: Column(
        children: [
          Text('The chart'),
          Text('The list'),
        ],
      ),
    );
  }
}
