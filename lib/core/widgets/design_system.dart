import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';

class DesignSystemCheckPage extends StatelessWidget {
  const DesignSystemCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Design System Guide')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // 1. 모든 타이포그래피 확인
          _buildSectionTitle('1. Typography (Pretendard)'),
          _buildTextRow(
            'Title Primary',
            '20px / 600',
            AppTextStyles.titlePrimary20w600,
          ),
          _buildTextRow(
            'Title Secondary Bold',
            '18px / 600',
            AppTextStyles.titleSecondary18w600,
          ),
          _buildTextRow(
            'Title Secondary Medium',
            '18px / 500',
            AppTextStyles.titleSecondary18w500,
          ),
          const SizedBox(height: 10),
          _buildTextRow(
            'Body Primary Bold',
            '16px / 600',
            AppTextStyles.bodyPrimary16w600,
          ),
          _buildTextRow(
            'Body Primary Medium',
            '16px / 500',
            AppTextStyles.bodyPrimary16w500,
          ),
          _buildTextRow(
            'Body Secondary Medium',
            '14px / 500',
            AppTextStyles.bodySecondary14w500,
          ),
          const SizedBox(height: 10),
          _buildTextRow(
            'Label Status',
            '12px / 500',
            AppTextStyles.labelStatus12w500,
          ),
          _buildTextRow(
            'Label Chat',
            '10px / 500',
            AppTextStyles.labelChat10w500,
          ),

          const SizedBox(height: 40),

          // 2. 모든 브랜드 및 상태 컬러 확인
          _buildSectionTitle('2. Brand & State Colors'),
          _buildColorGrid([
            _ColorItem('Point', AppColors.brandPoint, '#1C457D'),
            _ColorItem('Main', AppColors.brandMain, '#4F76A8'),
            _ColorItem('Hint', AppColors.brandHintText, '#95ADCB'),
            _ColorItem('PopUp', AppColors.brandPopUp, '#CCDDF4'),
            _ColorItem('Success', AppColors.success, '#0088FF'),
            _ColorItem('Warning', AppColors.warning, '#FFD000'),
            _ColorItem('Error', AppColors.error, '#F20000'),
          ]),

          const SizedBox(height: 40),

          // 3. 모든 그레이 스케일 확인 (누락 없이 포함)
          _buildSectionTitle('3. Grey Scale'),
          _buildColorGrid([
            _ColorItem('Black', AppColors.black, '#111111'),
            _ColorItem('Grey 1', AppColors.grey1, '#757575'),
            _ColorItem('Grey 2', AppColors.grey2, '#CCCCCC'),
            _ColorItem('Grey 3', AppColors.grey3, '#EEEEEE'),
            _ColorItem('Grey 4', AppColors.grey4, '#F8F8F8'),
            _ColorItem('White', AppColors.white, '#FFFFFF'),
          ]),

          const SizedBox(height: 40),

          // 4. 컴포넌트 테마 적용 확인
          _buildSectionTitle('4. Components Preview'),
          const Text(
            'ElevatedButton (Main Color / Radius 4)',
            style: AppTextStyles.bodySecondary14w500,
          ),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: () {}, child: const Text('입장하기')),
          const SizedBox(height: 20),
          const Text(
            'TextField (Radius 8)',
            style: AppTextStyles.bodySecondary14w500,
          ),
          const SizedBox(height: 8),
          const TextField(decoration: InputDecoration(hintText: '이름을 입력해주세요')),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // 섹션 제목 위젯
  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.titleSecondary18w600),
        const Divider(thickness: 2, height: 24),
      ],
    );
  }

  // 텍스트 스타일 확인용 행
  Widget _buildTextRow(String label, String detail, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label ($detail)',
            style: AppTextStyles.labelChat10w500.copyWith(
              color: AppColors.grey1,
            ),
          ),
          Text('Inning 디자인 시스템 Pretendard', style: style),
        ],
      ),
    );
  }

  // 컬러 그리드 위젯
  Widget _buildColorGrid(List<_ColorItem> items) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: items
          .map(
            (item) => Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: BorderRadius.circular(8),
                    // ignore: deprecated_member_use
                    border: Border.all(color: AppColors.grey2.withOpacity(0.5)),
                  ),
                ),
                const SizedBox(height: 8),
                Text(item.name, style: AppTextStyles.labelStatus12w500),
                Text(
                  item.hex,
                  style: const TextStyle(fontSize: 10, color: AppColors.grey1),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _ColorItem {
  final String name;
  final Color color;
  final String hex;
  _ColorItem(this.name, this.color, this.hex);
}
