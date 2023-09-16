import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import 'package:task_master/providers/providers.dart';
import 'package:task_master/utils/utils.dart';
import 'package:task_master/widgets/widgets.dart';

import '../config/theme/constants.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(TimeProvider);
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Date',
            hintText: DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
              icon: const FaIcon(FontAwesomeIcons.calendar),
              onPressed: () => Helper.selectDate(context, ref),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Time',
            hintText: Helper.timeToString(time),
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: const FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    final time = ref.read(TimeProvider);
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppConst.kAccent,
              ),
            ),
            child: child!,
          );
        });
    if (pickedTime != null) {
      ref.read(TimeProvider.notifier).state = pickedTime;
    }
  }
}
