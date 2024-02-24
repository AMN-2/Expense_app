// ignore_for_file: unused_field, non_constant_identifier_names, sort_child_properties_last, prefer_const_constructors
// import 'dart:ffi';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:expensiveapp/model/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expenses expense) onAddExpense;
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
/////////////////////////////////// some variable  ///////////////////////////////////
  final _titleControlller = TextEditingController();
  final _amountcontroller = TextEditingController();
  DateTime newdate = DateTime.now();
  DateTime? _selectedate;
  Categorys? name;
  String? selectedCategory = 'Category';
/////////////////////////////////// Start Date Picker  ///////////////////////////////////
  _presentdatePicker() async {
    final now = DateTime.now();
    final first_Date = DateTime(now.year - 1, now.month, now.day);
    final pickedate = await showDatePicker(
      initialDate: now,
      context: context,
      firstDate: first_Date,
      lastDate: now,
    );
    setState(() {
      _selectedate = pickedate;
    });
  }
/////////////////////////////////// End Of Date Picker Function  ///////////////////////////////////

/////////////////////////////////// start submited function ///////////////////////////////////
  _submitExpenseData() {
    // title and date validator
    if (_titleControlller.text.trim().isEmpty ||
        _selectedate == null ||
        name == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            // scrollable: true,
            backgroundColor: Color.fromARGB(255, 46, 46, 46),
            title: Center(
              child: Text(
                'invaled inpput',
                style: GoogleFonts.openSans(color: Colors.white),
              ),
            ),
            content: Text(
              'Please Make Sure The Valid Title , Amount , Date And Category Was Entered ',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 200, 112, 254),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Okey',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 200, 112, 254),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
    /////////////////////////////////// start Amount Validator  ///////////////////////////////////
    else {
      final _amount = double.tryParse(_amountcontroller.text);
      final invaledAmount = _amount == null || _amount <= 0;
      // start validate the amount
      if (_amount == 0 || invaledAmount) {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              backgroundColor: Color.fromARGB(255, 46, 46, 46),
              title: Center(
                child: Text(
                  'invaled inpput',
                  style: GoogleFonts.openSans(color: Colors.white),
                ),
              ),
              content: Text(
                'Please Make Sure The Amount Value Not - And Not Equal To 0 ',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 123, 7),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Okey',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 123, 7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
      // end the amount validate
/////////////////////////////////// Accsess the Expense  ///////////////////////////////////
      //
      else {
        widget.onAddExpense(Expenses(
            title: _titleControlller.text,
            amount: _amount,
            date: _selectedate!,
            category: name!));
      }
    }
  }

/////////////////////////////////// End of submited function ///////////////////////////////////

  @override
  Widget build(BuildContext context) {
    var stylese = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          TextField(
            controller: _titleControlller,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Title',
                style: stylese,
              ),
            ),
          ),
          TextField(
            cursorWidth: 1,
            // cursorHeight: 15 ,
            controller: _amountcontroller,
            // maxLength: 50,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: "\$  ",
              label: Text(
                'Amount',
                style: stylese,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: _presentdatePicker,
                icon: Icon(Icons.date_range),
              ),
              DropdownButton(
                hint: Text(
                  "${selectedCategory}",
                  style: stylese,
                ),

                // icon: Icon(Icons.category),
                items: Categorys.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(),
                          style: stylese,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    print('null the Category ');
                  } else {
                    setState(() {
                      name = value;
                      selectedCategory = value.name.toString().toUpperCase();
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _submitExpenseData();
                },
                child: Center(
                  child: Text(
                    'Add Expense',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
