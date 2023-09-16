import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_master/providers/providers.dart';
import 'package:task_master/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:task_master/widgets/widgets.dart';

import '../config/theme/constants.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DisplayBlackText(
            text: "Category",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const Gap(10),
          Expanded(
              child: ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        ref.read(categoryProvider.notifier).state = category;
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: CircleContainer(
                        color: category == selectCategory
                            ? AppConst.kAccent
                            : Colors.white,
                        child: Icon(
                          category.icon,
                          color: category == selectCategory
                              ? AppConst.kSurface
                              : category.color,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(8),
                  itemCount: categories.length)),
        ],
      ),
    );
  }
}
