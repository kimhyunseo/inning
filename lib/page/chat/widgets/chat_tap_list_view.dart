import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/chat/widgets/chat_message.dart';

// 챗버블 패키지 사용
class ChatTapListView extends StatefulWidget {
  const ChatTapListView({super.key});

  @override
  State<ChatTapListView> createState() => _ChatTapListViewState();
}

class _ChatTapListViewState extends State<ChatTapListView> {
  // 테스트용
  final List<ChatMessage> messages = [
    ChatMessage(content: '안녕하세요', isMe: false),
    ChatMessage(content: '여기\n맛집이\n어디\n있나요\n?', isMe: false),
    ChatMessage(content: '경기장 안쪽에 치킨집 맛있습니다.', isMe: true),
  ];
  // 변수에 초기화 시켜주고, 리스트뷰 컨트롤러 속성에 해당 변수를 전달. 스크롤 동작을 컨트롤러 설정 가능
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      // 말풍선 크기조정
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      shrinkWrap: true,
      // 아이템 역순배치 지정. 아래에서 위로. 가상키보드 크기변화 감지
      reverse: true,
      // 스크롤 위치가 어디든 가장 아래에 위치해야 함
      controller: scrollController,
      // UI 완성 후 적용
      // itemCount: ChatMessage(content: content, isMe: isMe).length,
      // itemBuilder: (context, index) {
      //  return Bubble(chat: ChatMessage[index]);
      // }
      children: [
        // 위젯을 리턴해줘야 적용이 된다.
        // chat_bubble 패키지

        // 내 채팅 영역
        BubbleSpecialThree(
          text: messages[2].content,
          color: AppColors.warning,
          // 말풍선 꼬리 유무
          tail: true,
          textStyle: AppTextStyles.bodySecondary14w500.copyWith(
            color: AppColors.black,
          ),
        ),

        // 같은 사람이 2번 연속 메시지를 보냈다고 가정

        // 프로필이미지
        Row(
          children: [
            SizedBox(width: 50),
            Column(
              children: [
                // 닉네임하고 프로필사진은 한명이 여러 채팅을 치면 사라지도록 예외처리
                SizedBox(),
                BubbleSpecialThree(
                  text: messages[1].content,
                  color: AppColors.white,
                  tail: false,
                  isSender: false,
                  textStyle: AppTextStyles.bodySecondary14w500.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필이미지
            Stack(
              // 영역 밖으로 나가도 보이게
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  // 크기 50
                  radius: 25,
                  backgroundColor: AppColors.brandHintText,
                  // 실제이미지 적용
                  // backgroundImage: NetworkImage('Url'),
                  // 기본이미지 적용
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: AppColors.brandPoint,
                  ),
                ),
                Positioned(
                  top: -5,
                  // isMe? null
                  left: -5,
                  right: 25,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: AppColors.warning,
                    // 이미지가 부모 크기를 넘지 못하게
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/teams/doosan_bears/logo.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // 텍스트가 길어졌을 때 에러방지
            Expanded(
              child: Column(
                children: [
                  SizedBox(width: 100),
                  BubbleSpecialThree(
                    text: messages[0].content,
                    color: AppColors.white,
                    // 말풍선 꼬리 유무
                    tail: true,
                    isSender: false,
                    textStyle: AppTextStyles.bodySecondary14w500.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
