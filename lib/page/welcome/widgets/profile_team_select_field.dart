import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/team_select/team_select_page.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';
import 'package:inning/page/welcome/widgets/profile_input_field.dart';

class ProfileTeamSelectField extends ConsumerWidget {
  const ProfileTeamSelectField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTeam = ref.watch(welcomeProvider).favoriteTeam;

    return GestureDetector(
      onTap: () {
        // ref.read(welcomeProvider.notifier).updateFavoriteTeam();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectePage()),
        );
      },
      child: ProfileInputField(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20 / 2),
              child: Image.network('https://picsum.photos/20'),
            ),
            // Spacer(),
            Text(
              '구단',
              style: AppTextStyles.bodyPrimary16w500.copyWith(
                color: AppColors.grey1,
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
