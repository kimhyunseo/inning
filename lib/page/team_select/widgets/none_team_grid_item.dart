import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

class NoneTeamGridItem extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const NoneTeamGridItem({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? AppColors.brandPopUp : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 로고 영역
            Expanded(
              flex: 3,
              child: Center(
                child: Icon(Icons.block, size: 50, color: AppColors.grey2),
              ),
            ),

            // 텍스트 영역
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  '응원팀 없음',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.labelStatus12w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
