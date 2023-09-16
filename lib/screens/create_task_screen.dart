import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:task_master/config/routes/routes.dart';
import 'package:task_master/config/theme/constants.dart';
import 'package:task_master/providers/date_provider.dart';
import 'package:task_master/providers/providers.dart';
import 'package:task_master/utils/utils.dart';
import 'package:task_master/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../data/models/task.dart';
import '../utils/helpers.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppConst.kSurface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppConst.kSurface,
        title: const DisplayBlackText(
          text: "Add New Task",
          fontSize: 24.0,
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.close_rounded,
            color: AppConst.kBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CommonTextField(
              title: "Task Title",
              hintText: 'Enter your task',
              controller: _titleController,
            ),
            const Gap(16),
            const SelectCategory(),
            const Gap(16),
            const SelectDateTime(),
            const Gap(16),
            CommonTextField(
              title: 'Note',
              hintText: 'Task Note',
              maxLines: 6,
              controller: _noteController,
            ),
            const Gap(60),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: ElevatedButton(
                onPressed: _createTask,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppConst.kPrimary),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Save",
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
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(TimeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        time: Helper.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        category: category,
        isCompleted: false,
      );
      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        AppAlerts.displaySnackBar(context, "Task created Successfully");
        context.go(RouteLocation.home);
      });
    } else {
      AppAlerts.displaySnackBar(context, "Task title cannot be empty");
    }
  }
}
