import 'package:flutter/material.dart';
import 'package:personal_expanses/expenses.dart';

void main() {
  runApp(const MyApp());
}

var myColorSchema = ColorScheme.fromSeed(seedColor: Colors.blue);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: myColorSchema,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorSchema.onPrimaryContainer,
          foregroundColor: myColorSchema.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: myColorSchema.onSecondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myColorSchema.primaryContainer,
          ),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: const TextStyle(
            color: Colors.black,
          ),
          bodyMedium: const TextStyle(
            color : Colors.white
          )

        ),
        iconTheme: const IconThemeData().copyWith(
          color: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          labelStyle: const TextStyle(color : Colors.black),
        ),
  
      ),
      home: const Expenses(),
    );
  }
}
