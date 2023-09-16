import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/data/data.dart';

final TaskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
