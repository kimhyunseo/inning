import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/app_shadow.dart';
import 'package:inning/core/fonts.dart';

class OutsideStadiumCard extends StatelessWidget {
  const OutsideStadiumCard({super.key, this.address, required this.onRetry});

  final String? address;
  // '위치파악불가' 콜백함수 추가
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// 카드
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [AppShadows.defaultShadow],
          ),
          child: Column(
            children: [
              /// 지도 / 이미지 영역
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.grey4,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  children: [
                    /// 중앙 아이콘
                    Align(
                      alignment: const Alignment(0, 0.4),
                      child: Icon(
                        Icons.map_outlined,
                        size: 100,
                        color: AppColors.brandPopUp,
                      ),
                    ),

                    /// 현재 위치 뱃지
                    Positioned(
                      top: 15,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [AppShadows.defaultShadow],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 4,
                                backgroundColor: AppColors.error,
                              ),
                              SizedBox(width: 8),
                              // 받아온 주소가 있으면 표시, 없으면 기본값
                              Text(
                                '현재 위치: ${address ?? '위치 파악 불가'}',
                                style: AppTextStyles.labelStatus12w500.copyWith(
                                  color: AppColors.brandPoint,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 텍스트
              Column(
                children: [
                  Text(
                    '아직 야구장 밖이에요',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.titlePrimary20w600,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '야구장에 입장하면 이닝 채팅이 열려요',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodySecondary14w500.copyWith(
                      color: AppColors.grey1,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 비활성 버튼
              ElevatedButton(onPressed: null, child: Text("야구장 입장 대기중")),
            ],
          ),
        ),

        /// 하단 안내
        GestureDetector(
          onTap: () {
            print("위치 재조회");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 16,
                color: AppColors.brandPoint,
              ),
              SizedBox(width: 5),
              Text(
                '현재 위치가 맞지 않나요?',
                style: AppTextStyles.labelStatus12w500.copyWith(
                  color: AppColors.brandPoint,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
