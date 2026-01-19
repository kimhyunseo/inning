import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey4,
      appBar: AppBar(
        title: Text('프로필', style: AppTextStyles.titlePrimary20w600),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 61),
            Text('이 프로필로 채팅방에 입장할까요?', style: AppTextStyles.titlePrimary20w600),
            // 컨테이너
            SizedBox(height: 77),
            Container(
              width: double.infinity,
              height: 283,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3FB2B2B2),
                    blurRadius: 16,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Stack(
                    children: [
                      // 사람 아이콘
                      Container(
                        width: 103,
                        height: 103,
                        decoration: BoxDecoration(
                          color: AppColors.brandPopUp,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 85,
                          color: AppColors.brandHintText,
                        ),
                      ),
                      // 연필 아이콘
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: AppColors.grey3,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 18,
                            color: AppColors.grey1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // 이름 컨테이너
                  SizedBox(height: 31),
                  Container(
                    width: 233,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppColors.grey4,
                      borderRadius: BorderRadius.circular(4),
                      // border: Border.all(color: Colors.red),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: '이름',
                              hintStyle: AppTextStyles.bodyPrimary16w500
                                  .copyWith(color: AppColors.grey1),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: AppColors.grey1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // 구단선택 컨테이너
                  Container(
                    padding: EdgeInsets.all(8),
                    width: 233,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppColors.grey4,
                      borderRadius: BorderRadius.circular(4),
                    ),
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
                        // Spacer(),
                        Icon(
                          Icons.arrow_forward_outlined,
                          size: 20,
                          color: AppColors.grey1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // 입장하기 텍스트
            SafeArea(
              child: ElevatedButton(onPressed: () {}, child: Text('입력 완료')),
            ),
          ],
        ),
      ),
    );
  }
}
