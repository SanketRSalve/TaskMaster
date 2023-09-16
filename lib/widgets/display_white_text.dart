import 'package:flutter/material.dart';
import 'package:task_master/config/theme/constants.dart';

class DisplayBlackText extends StatelessWidget {
  const DisplayBlackText(
      {super.key, required this.text, this.fontSize, this.fontWeight});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppConst.kBlack,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
