import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/app_shadow.dart';
import 'package:inning/core/fonts.dart';

class LocationPermissionCard extends StatelessWidget {
  const LocationPermissionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 36, 16, 16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [AppShadows.defaultShadow],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  /// 아이콘 배경
                  Container(
                    width: 76,
                    height: 76,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.brandPopUp,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.location_off_outlined,
                      size: 48,
                      color: AppColors.brandMain,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// 텍스트 영역
                  Column(
                    children: [
                      Text(
                        '지금 어디서\n응원 중인지 알려주세요',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.titlePrimary20w600,
                      ),
                      SizedBox(height: 12),
                      Text(
                        '야구장 안에서만 채팅이 열려요.\n정확한 위치 확인을 위해 권한이 필요합니다.',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodySecondary14w500.copyWith(
                          color: AppColors.grey1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 36),

              /// 버튼
              ElevatedButton(onPressed: () {}, child: Text("위치 권환 허용")),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_outline_rounded, color: AppColors.grey2, size: 16),
            SizedBox(width: 4),
            Text(
              'Inning은 사용자의 위치를 수집하지 않습니다.',
              textAlign: TextAlign.center,
              style: AppTextStyles.labelStatus12w500.copyWith(
                color: AppColors.grey2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
