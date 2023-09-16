import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:task_master/config/routes/routes.dart';
import 'package:task_master/config/theme/constants.dart';
import 'package:task_master/data/data.dart';
import 'package:task_master/providers/providers.dart';
import 'package:task_master/utils/utils.dart';
import 'package:task_master/widgets/display_task_list.dart';
import 'package:task_master/widgets/display_white_text.dart';
import 'package:intl/intl.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks, ref);
    final incompletedTasks = _incompleteTasks(taskState.tasks, ref);
    final selectDate = ref.watch(dateProvider);

    return Scaffold(
      backgroundColor: AppConst.kSurface,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: deviceSize.height * 0.3,
                  width: deviceSize.width,
                  color: const Color(0xFFF1EDFF),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Helper.selectDate(context, ref),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DisplayBlackText(
                                text: DateFormat.yMMMd().format(selectDate),
                                fontSize: 16,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 5.0),
                                child: Icon(
                                  Icons.edit_calendar_rounded,
                                  size: 24.0,
                                  color: AppConst.kBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const DisplayBlackText(
                          text: "Task Master",
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 180,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                      // onTap: () => Helper.selectDate(context, ref),
                      child: DisplayTaskList(
                        tasks: incompletedTasks,
                      ),
                    ),
                    const Gap(20),
                    const DisplayBlackText(
                      text: 'Completed',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const Gap(20),
                    DisplayTaskList(
                      tasks: completedTasks,
                      isCompletedTasks: true,
                    ),
                    const Gap(20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: ElevatedButton(
                        onPressed: () => context.push(RouteLocation.createTask),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppConst.kPrimary),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            "Add New Task",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      final isTaskDay = Helper.isTaskFromSelectedDate(task, selectedDate);
      if (task.isCompleted && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }

  List<Task> _incompleteTasks(List<Task> tasks, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider);
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      final isTaskDay = Helper.isTaskFromSelectedDate(task, selectedDate);
      if (!task.isCompleted && isTaskDay) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}
