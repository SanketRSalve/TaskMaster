import 'package:flutter/material.dart';
import 'package:task_master/config/theme/constants.dart';
import 'package:task_master/utils/extensions.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({super.key, this.child, required this.height});
  final Widget? child;
  final double height;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    return Container(
      width: deviceSize.width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD4E3FE),
            offset: Offset(0, 6),
            blurRadius: 10,
          ),
        ],
        color: AppConst.kWhite,
      ),
      child: child,
    );
  }
}
