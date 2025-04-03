import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  String taskName;
  bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          children: [
            Checkbox(value: taskcompleted, onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(
                decoration:
                    taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
