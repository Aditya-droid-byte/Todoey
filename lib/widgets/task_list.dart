import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodoey_flutter/widgets/task_tile.dart';

import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
          itemBuilder: (context, index) {
            final tasks = taskData.tasks[index];
            return TaskTile(
              taskTitle: tasks.name,
              isChecked: tasks.isDone,
              checkBoxCallBack: (checkBoxState) {
                taskData.updateAsk(tasks);
              },
              longPressCallBack: () {
                taskData.deleteData(tasks);
                Navigator.of(context).pop();
              },
            );
          },
          itemCount: taskData.taskCount);
    });
  }
}
