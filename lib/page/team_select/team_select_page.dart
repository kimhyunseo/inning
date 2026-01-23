import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/team_select/team_select_view_model.dart';
import 'package:inning/page/team_select/widgets/team_grid_item.dart';

class TeamSelectPage extends ConsumerWidget {
  const TeamSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(teamSelectProvider);
    final viewModel = ref.read(teamSelectProvider.notifier);

    final teamCount = state.teams.length;

    return Scaffold(
      appBar: AppBar(title: const Text('구단 선택'), centerTitle: true),

      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 32),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                ref.read(teamSelectProvider.notifier).confirmSelected();
                Navigator.pop(context);
                // 업데이트팀 으로 상태업데이트, 선택이 된 팀을 객체로 넘겨주어
              },
              child: const Text('선택 완료'),
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 안내 텍스트
            const SizedBox(height: 8),
            const Text(
              '응원하는 구단을 선택해주세요',
              style: AppTextStyles.titlePrimary20w600,
            ),
            const SizedBox(height: 24),

            /// 그리드
            Expanded(
              child: GridView.builder(
                itemCount: teamCount + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (_, index) {
                  if (index == teamCount) {
                    return TeamSelectGridItem(
                      team: null,
                      isSelected: state.selectedTeamId == null,
                      onTap: viewModel.selectNone,
                    );
                  }

                  final team = state.teams[index];

                  return TeamSelectGridItem(
                    team: team,
                    isSelected: state.selectedTeamId == team.id,
                    onTap: () => viewModel.selectTeam(team.id),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
