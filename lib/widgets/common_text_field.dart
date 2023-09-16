import 'package:flutter/material.dart';
import 'package:task_master/config/theme/constants.dart';
import 'package:gap/gap.dart';
import 'package:task_master/widgets/widgets.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
  });

  final String title;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DisplayBlackText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        const Gap(10),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          maxLines: maxLines,
          decoration: InputDecoration(
            fillColor: AppConst.kWhite,
            suffixIconColor: AppConst.kGrey,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppConst.kPrimary),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppConst.kAccent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14.0,
              color: AppConst.kGrey,
            ),
          ),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
