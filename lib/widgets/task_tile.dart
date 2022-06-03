import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final VoidCallback longPressCallBack;
  final bool isChecked;
  final String taskTitle;
  final ValueChanged<bool?> checkBoxCallBack;
  const TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.longPressCallBack,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //onLongPress: longPressCallBack,
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Delete Task"),
              content: const Text("Do you want to delete this task?"),
              actions: [
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  onPressed: longPressCallBack,
                  child: const Text("Yes"),
                )
              ],
            );
          },
        );
      },
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          checkBoxCallBack(value);
        },
      ),
    );
  }
}

// }
