import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:toodoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy notebook'),
    Task(name: 'buy softie'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateAsk(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteData(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
