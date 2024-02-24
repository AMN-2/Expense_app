// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, unused_field, unused_local_variable, avoid_print
import 'package:expensiveapp/Widget/Expenses_list/expenses_list.dart';
import 'package:expensiveapp/Widget/new_expense.dart';
import 'package:expensiveapp/main.dart';
import 'package:expensiveapp/model/expense.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  List<Expenses> _registerdExpense = [];
  TextStyle TXTStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.deepPurple,
    fontSize: 40,
  );

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // backgroundColor: Colors.amber,
      context: context,
      builder: (context) {
        return NewExpense(
          onAddExpense: _addExpense,
        );
      },
    );
  }

  void _addExpense(Expenses a) {
    setState(() {
      _registerdExpense.add(a);
    });
    Navigator.pop(context);
  }

  void _removeExpense(Expenses ex) {
    print('the index is deleted ');
    final expenseIndex = _registerdExpense.indexOf(ex);
    setState(() {
      _registerdExpense.remove(ex);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: false,
        content: Text(
          "Now You Deleted The Expense ",
          style: TextStyle(color: Colors.white),
        ),
        action: SnackBarAction(
          backgroundColor: k.onPrimaryContainer,
          label: 'Undo',
          textColor: k.onError,
          onPressed: () {
            setState(
              () {
                _registerdExpense.insert(expenseIndex, ex);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No Data Here ' , style: Theme.of(context).textTheme.titleLarge,),
    );
    if (_registerdExpense.isNotEmpty) {
      mainContent = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ExpensesList(
                expenses: _registerdExpense,
                onRemoveExpense: _removeExpense,
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            padding: EdgeInsets.all(20),
            icon: Icon(
              Icons.add,
              size: 25,
            ),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
