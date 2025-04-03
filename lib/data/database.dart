import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [
    ["Make Tutorial", false],
    ["Make Tea", false],
    ["Make Home", false],
  ];

  final _todoBox = Hive.box('todoBox');

  void createInitalData() {
    todoList = [];
  }

  void loadData() {
    todoList = _todoBox.get("TODOLIST");
  }

  void updateDatabase() {
    _todoBox.put("TODOLIST", todoList);
  }
}
