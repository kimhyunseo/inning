import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/page/team_select/team_select_view_model.dart';
import 'package:inning/page/team_select/widgets/none_team_grid_item.dart';
import 'package:inning/page/team_select/widgets/team_grid_item.dart';

class SelectPage extends ConsumerWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(teamSelectViewModelProvider);
    final setState = ref.read(teamSelectViewModelProvider.notifier);
    final teamCount = state.teams.length;

    return Scaffold(
      appBar: AppBar(title: Text('구단 선택')),

      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16).copyWith(bottom: 32),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("선택 완료"),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
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
              return NoneTeamGridItem(
                isSelected: state.type == TeamSelectType.none,
                onTap: () {
                  return setState.selectNone();
                },
              );
            }

            final team = state.teams[index];
            final isSelected =
                state.type == TeamSelectType.team &&
                state.selectedTeamId == team.id;

            return TeamGridItem(
              team: team,
              isSelected: isSelected,
              onTap: () => ref
                  .read(teamSelectViewModelProvider.notifier)
                  .selectTeam(team.id),
            );
          },
        ),
      ),
    );
  }
}
