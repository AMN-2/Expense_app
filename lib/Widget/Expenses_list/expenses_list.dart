// ignore_for_file: prefer_const_constructors

// import 'package:expensiveapp/Widget/expense.dart';
import 'package:expensiveapp/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:expensiveapp/Widget/Expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expenses> expenses;
  final void Function(Expenses expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            key: ValueKey((expenses[index])),
            child: ExpensesItem(
              expenses[index],
            ),
          );
        },
      ),
    );
  }
}
