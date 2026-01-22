import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey4,
      body: Align(
        alignment: Alignment(0, -0.2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center, // 아이콘과 인디케이터를 중앙에 맞춤
              children: [
                const Icon(
                  Icons.stadium,
                  size: 80,
                  color: AppColors.brandPopUp,
                ),
                SizedBox(
                  width: 120, // 아이콘보다 조금 크게
                  height: 120,
                  child: const CircularProgressIndicator(
                    color: AppColors.brandHintText,
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '정보를 불러오고 있어요...',
              style: AppTextStyles.titleSecondary18w500.copyWith(
                color: AppColors.brandPoint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
