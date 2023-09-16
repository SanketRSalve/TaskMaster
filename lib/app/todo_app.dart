import 'package:flutter/material.dart';
import 'package:task_master/config/routes/routes.dart';
import 'package:task_master/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routesProvider);
    return MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}
