import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/team.dart';

class TeamGridItem extends StatelessWidget {
  final Team team;
  final bool isSelected;
  final VoidCallback onTap;

  const TeamGridItem({
    super.key,
    required this.team,
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
          children: [
            // 로고 영역
            Expanded(
              flex: 3,
              child: Center(
                child: Image.asset(team.emblemAsset, fit: BoxFit.contain),
              ),
            ),

            // 텍스트 영역
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  team.name,
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
