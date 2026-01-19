import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';

class ProfileInputField extends StatelessWidget {
  final Widget child;

  ProfileInputField({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 233,
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.grey4,
        borderRadius: BorderRadius.circular(4),
      ),
      child: child, // 위젯
    );
  }
}
