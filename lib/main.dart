import 'package:flutter/material.dart';
import 'package:todo_app/pages/todoapp.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Todoapp(),
    );
  }
}
