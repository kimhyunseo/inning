import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/team_select/team_select_page.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';

class ProfileTeamSelectField extends ConsumerWidget {
  const ProfileTeamSelectField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(welcomeProvider).user.favoriteTeam;

    return GestureDetector(
      onTap: () {
        // ref.read(welcomeProvider.notifier).updateFavoriteTeam();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeamSelectPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
        decoration: BoxDecoration(
          color: AppColors.grey4,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20 / 2),
              child: selectedTeam != null
                  ? Image.asset(selectedTeam.logoAsset, width: 24, height: 24)
                  : Icon(Icons.error_outline, size: 20, color: AppColors.grey2),
            ),
            Text(
              selectedTeam?.name ?? '구단 선택',
              style: AppTextStyles.bodyPrimary16w500.copyWith(
                color: selectedTeam != null ? AppColors.black : AppColors.grey1,
              ),
            ),
            Icon(
              Icons.arrow_forward_outlined,
              size: 20,
              color: AppColors.grey1,
            ),
          ],
        ),
      ),
    );
  }
}
