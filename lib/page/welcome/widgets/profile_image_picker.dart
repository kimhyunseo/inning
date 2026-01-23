import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/page/welcome/welcome_view_model.dart';

class ProfileImagePicker extends ConsumerWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImageUrl = ref.watch(welcomeProvider).profileImage;
    return GestureDetector(
      onTap: () async {
        // 이미지피커 객체 생성
        ImagePicker imagePicker = ImagePicker();
        // 이미지피커 객체의 픽이미지라는 메서드 호츌
        XFile? xFile = await imagePicker.pickImage(source: ImageSource.gallery);
        print('경로: ${xFile?.path}');
        if (xFile != null) {
          await ref.read(welcomeProvider.notifier).uploadImage(xFile);
        }
      },
      child: Stack(
        children: [
          // 사람 아이콘
          Container(
            width: 103,
            height: 103,
            decoration: BoxDecoration(
              color: AppColors.brandPopUp,
              shape: BoxShape.circle,
            ),
            child: profileImageUrl != null && profileImageUrl.isNotEmpty
                ? ClipOval(
                    child: Image.network(profileImageUrl, fit: BoxFit.cover),
                  )
                : Icon(Icons.person, size: 85, color: AppColors.brandHintText),
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
              child: Icon(Icons.edit, size: 18, color: AppColors.grey1),
            ),
          ),
        ],
      ),
    );
  }
}
