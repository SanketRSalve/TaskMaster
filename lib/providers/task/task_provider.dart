import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(TaskRepositoryProvider);
  return TaskNotifier(repository);
});
