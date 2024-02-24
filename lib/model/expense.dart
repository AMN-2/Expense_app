// import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Categorys{ food, travel, leisure, work }

const Categoryicon = {
  Categorys.food: Icons.lunch_dining,
  Categorys.travel: Icons.flight_takeoff,
  Categorys.leisure: Icons.movie,
  Categorys.work: Icons.work,
};

class Expenses {
  Expenses(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categorys category;
  String get getFormatDate {
    return formatter.format(date);
  }
}
