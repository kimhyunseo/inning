import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/home/home_view_model.dart';

class InningBadge extends ConsumerWidget {
  const InningBadge({super.key, required this.half});

  final String half;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);

    final phase = state.inningPhase;
    final color = inningColor(phase);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          const SizedBox(width: 4),
          Text(
            '${state.currentInning}회$half',
            style: AppTextStyles.labelStatus12w500.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
