import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:task_master/config/theme/constants.dart';
import 'package:task_master/utils/utils.dart';
import 'package:task_master/widgets/circle_container.dart';
import '../data/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
      child: Row(
        children: [
          CircleContainer(
            color: task.isCompleted
                ? AppConst.kAccent.withOpacity(0.5)
                : AppConst.kAccent,
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.isCompleted
                    ? AppConst.kWhite.withOpacity(0.5)
                    : AppConst.kWhite,
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                      decoration: textDecoration,
                      fontSize: 16,
                      fontWeight: fontWeight),
                ),
                const Gap(4.0),
                Text(
                  task.time,
                  style: const TextStyle(
                    color: AppConst.kGrey,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onCompleted),
        ],
      ),
    );
  }
}
