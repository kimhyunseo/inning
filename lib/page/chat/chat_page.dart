import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/widgets/common_app_bar.dart';
import 'package:inning/page/chat/widgets/chat_tap_list_view.dart';
import 'package:inning/page/chat/widgets/chat_tap_notice.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 빈 화면 터치시 키보드 사라짐
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.brandPopUp,
        resizeToAvoidBottomInset: false,

        appBar: const CommonAppBar(
          title: '경기 관람 채팅방',
          actionIcon: Icons.info_outline,
        ),

        bottomSheet: Container(
          color: AppColors.brandPopUp,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                12,
                16,
                MediaQuery.of(context).viewInsets.bottom > 0
                    ? MediaQuery.of(context).viewInsets.bottom + 16
                    : 12,
              ),
              child: TextFormField(
                controller: _controller,
                focusNode: _focusNode,

                // 키보드
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 3,

                autofocus: false,
                style: AppTextStyles.bodySecondary14w500.copyWith(
                  color: AppColors.black,
                ),
                decoration: InputDecoration(
                  hintText: '내용을 입력하세요.',
                  hintStyle: AppTextStyles.bodySecondary14w500.copyWith(
                    color: AppColors.brandHintText,
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide.none,
                  ),

                  // 오른쪽 전송아이콘
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        print('전송: ${_controller.text}');
                        // 전송 후 입력칸 비움
                        _controller.clear();
                      }
                    },
                    icon: Icon(Icons.send, color: AppColors.brandPoint),
                  ),
                ),
                // 엔터버튼을 전송 아이콘으로 변경
                textInputAction: TextInputAction.newline,
                onFieldSubmitted: (value) {
                  print('전송: $value');
                  _controller.clear();
                },
              ),
            ),
          ),
        ),

        // 스크롤 가능하게
        body: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 50),
          child: Column(
            children: [
              // 공지사항 영역
              const ChatTapNotice(),

              // 채팅 리스트 영역 (남은 공간을 꽉 채움)
              const Expanded(
                //
                child: ChatTapListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
