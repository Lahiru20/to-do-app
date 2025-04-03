import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dialogbox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add a new Task",
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: onSave,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Save"),
                    ),
                    SizedBox(width: 20),
                    MaterialButton(
                      onPressed: onCancel,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("Close"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
