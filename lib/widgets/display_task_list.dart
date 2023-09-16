import 'package:flutter/material.dart';
import 'package:task_master/providers/providers.dart';
import 'package:task_master/utils/extensions.dart';
import 'package:task_master/utils/utils.dart';
import 'package:task_master/widgets/task_tile.dart';
import 'package:task_master/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/task.dart';

class DisplayTaskList extends ConsumerWidget {
  const DisplayTaskList(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTaskMessage =
        isCompletedTasks ? "Nothing to show" : "There is no task todo";
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTaskMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showDeleteAlertDialog(context, ref, task);
                  },
                  onTap: () async {
                    //show details
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return TaskDetails(task: task);
                        });
                  },
                  child: TaskTile(
                    task: task,
                    onCompleted: (value) async {
                      await ref
                          .read(taskProvider.notifier)
                          .updateTask(task)
                          .then((value) {
                        AppAlerts.displaySnackBar(
                            context,
                            task.isCompleted
                                ? 'Task incomplete'
                                : 'Task completed');
                      });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 0.5,
                  indent: 12.0,
                  endIndent: 12.0,
                );
              },
            ),
    );
  }
}
