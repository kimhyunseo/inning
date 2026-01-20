import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

/// 이닝 단계
enum InningPhase { early, middle, late }

InningPhase getInningPhase(int inning) {
  if (inning <= 3) return InningPhase.early;
  if (inning <= 6) return InningPhase.middle;
  return InningPhase.late;
}

Color inningColor(InningPhase phase) {
  switch (phase) {
    case InningPhase.early:
      return Colors.green;
    case InningPhase.middle:
      return Colors.orange;
    case InningPhase.late:
      return AppColors.error;
  }
}

class InningBadge extends ConsumerWidget {
  const InningBadge({super.key, required this.inning, required this.half});

  final int inning;
  final String half;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // inning으로 phase 계산
    final phase = getInningPhase(inning);
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
            '$inning회$half',
            style: AppTextStyles.labelStatus12w500.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
