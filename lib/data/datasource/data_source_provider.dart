import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/data/datasource/datasource.dart';

final taskDatasourceProvider = Provider<TaskDatasource>((ref) {
  return TaskDatasource();
});
