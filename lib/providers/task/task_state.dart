import 'package:flutter/foundation.dart';

import '../../data/models/task.dart';

class TaskState {
  final List<Task> tasks;
  const TaskState({required this.tasks});
  const TaskState.initial({
    this.tasks = const [],
  });

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  bool operator ==(covariant TaskState other) {
    if (identical(this, other)) return true;

    return listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => tasks.hashCode;
}
