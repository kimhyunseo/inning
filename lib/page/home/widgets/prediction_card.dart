import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/app_shadow.dart';
import 'package:inning/core/fonts.dart';

class PredictionCard extends ConsumerWidget {
  const PredictionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(predictionCardProvider);
    final notifier = ref.read(predictionCardProvider.notifier);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadows: const [AppShadows.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 제목 + 서브텍스트
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('승부 예측', style: AppTextStyles.bodyPrimary16w600),

                  Text(
                    '오늘 경기의 승리 팀은 어디일까요?',
                    style: AppTextStyles.bodySecondary14w500.copyWith(
                      color: AppColors.brandMain,
                    ),
                  ),
                ],
              ),
              // 참여자 수
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: ShapeDecoration(
                  color: AppColors.grey4,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.grey3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.bar_chart, color: AppColors.grey1, size: 12),
                    SizedBox(width: 2),
                    Text(
                      '1,842명 참여',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111111),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // 팀 선택
          Row(
            children: [
              _TeamBox(teamName: 'LG 트윈스'),
              const SizedBox(width: 8),
              const Text(
                'VS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF95ADCB),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(width: 8),
              _TeamBox(teamName: '롯데 자이언츠'),
            ],
          ),
          const SizedBox(height: 20),
          // 투표 후 메시지
          if (state == PredictionCardState.voted)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LG 트윈스의 승리를 예측하셨군요!',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF757575),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => notifier.reset(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '다시 투표하기',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFCCCCCC),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _TeamBox extends StatelessWidget {
  final String teamName;
  const _TeamBox({required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          // 실제 투표는 Provider에서 관리
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFFCCDDF4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            teamName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F76A8),
            ),
          ),
        ),
      ),
    );
  }
}

enum PredictionCardState { notVoted, voted }

class PredictionCardNotifier extends Notifier<PredictionCardState> {
  @override
  PredictionCardState build() => PredictionCardState.notVoted;

  void vote() {
    state = PredictionCardState.voted;
  }

  void reset() {
    state = PredictionCardState.notVoted;
  }
}

// 페이지 내부 Provider
final predictionCardProvider =
    NotifierProvider<PredictionCardNotifier, PredictionCardState>(
      () => PredictionCardNotifier(),
    );
