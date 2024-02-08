import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
      category: (Category.work),
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: (Category.leisure),
    ),
    Expense(
      title: 'Chawarma',
      amount: 11.39,
      date: DateTime.now(),
      category: (Category.food),
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registredExpenses.add(expense);
    });
  }

  // Method that removes an expense from the registred expense list
  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpenses.indexOf(expense);

    setState(() {
      _registredExpenses.remove(expense);
    });

    // Clear all existing info messages
    ScaffoldMessenger.of(context).clearSnackBars();

    // Show an info message after an expense is romoved
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          // Action that could be done it the info message
          label: 'Undo',
          onPressed: () {
            setState(() {
              // Add  back the removed expense to the list
              _registredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // debugPrint(MediaQuery.of(context).size.height.toString());

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [
          Chart(expenses: _registredExpenses),
          Expanded(
            child: mainContent,
          )
        ],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _registredExpenses),),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
