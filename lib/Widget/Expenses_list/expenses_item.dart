// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors

import 'package:expensiveapp/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  ExpensesItem(this.expense, {super.key});

  final Expenses expense;
  TextStyle TXTStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    // color: Color.fromARGB(255, 255, 255, 255),
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Text(
                expense.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              children: [
                Text(
                  "\$  ${expense.amount.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.titleSmall
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      Categoryicon[expense.category],
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      expense.getFormatDate,
                      style: Theme.of(context).textTheme.titleSmall, 
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
