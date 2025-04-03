import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialogbox.dart';
import 'package:todo_app/util/todo_tile.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  final _todoBox = Hive.box('todoBox');
  TodoDatabase db = TodoDatabase();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    if (_todoBox.get("TODOLIST") == null) {
      db.createInitalData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void saveNewTask() {
    setState(() {
      if (!(textEditingController.text == '')) {
        db.todoList.add([textEditingController.text, false]);
        textEditingController.clear();
        db.updateDatabase();
      }
    });
    Navigator.of(context).pop();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateDatabase();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          controller: textEditingController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskcompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit_square),
            SizedBox(width: 10),
            Text("TODO"),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellowAccent.shade700,
        child: Icon(Icons.add),
      ),
    );
  }
}
