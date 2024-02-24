// ignore_for_file: deprecated_member_use

import 'package:expensiveapp/Widget/expense.dart';
import 'package:flutter/material.dart';

var k = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var s =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 162, 160, 225));
var darkT = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 24, 30),
        useMaterial3: true,
        colorScheme: darkT,
        cardTheme: const CardTheme().copyWith(
          color: darkT.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: darkT.onSecondaryContainer,
                fontSize: 20,
              ),
              titleMedium: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 20,
              ),
              titleSmall: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: k,
        ///////////////////////////////////////////////////////////////////////////////////////
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: k.onPrimaryContainer,
          foregroundColor: k.primaryContainer,
          centerTitle: true,
        ),
        ///////////////////////////////////////////////////////////////////////////////////////
        cardTheme: const CardTheme().copyWith(
          color: k.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        ///////////////////////////////////////////////////////////////////////////////////////
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: k.primaryContainer,
          ),
        ),
        ///////////////////////////////////////////////////////////////////////////////////////
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: k.onSecondaryContainer,
                fontSize: 20,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.normal,
                color: s.onSecondaryContainer,
                fontSize: 20,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: true,
      home: const Expense(),
    ),
  );
}
