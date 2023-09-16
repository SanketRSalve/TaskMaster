import 'package:flutter/material.dart';
import 'package:task_master/config/theme/constants.dart';
import 'package:task_master/providers/providers.dart';
import 'package:task_master/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/models/task.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyLarge?.copyWith(
            color: AppConst.kBlack,
          ),
        ),
        backgroundColor: AppConst.kSurface,
      ),
    );
  }

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: const Text("No"),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
          AppAlerts.displaySnackBar(context, "Task delete successfully");
          context.pop();
        });
      },
      child: const Text('Yes'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Are you sure you want to delete this task"),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
