import 'package:flutter/material.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/page/chat/widgets/chat_tap_app_bar.dart';
import 'package:inning/page/chat/widgets/chat_tap_list_view.dart';
import 'package:inning/page/chat/widgets/chat_tap_notice.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  // 메시지 추가함수 setstate 사용. 아래 구조도 변경 if문 사용

  // 클릭시 키보드
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 빈 화면 터치시 키보드 사라짐
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // 1. 테마의 배경색이 적용되도록 설정
        backgroundColor: AppColors.grey2,
        // 키보드가 올라올 때 body가 밀려올라감
        resizeToAvoidBottomInset: true,

        // 2. 앱바(삭제할 것 파일)
        appBar: const ChatTapAppBar(),

        // 스크롤 가능하게
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                // 공지사항 영역
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: const ChatTapNotice(),
                ),

                // 채팅 리스트 영역 (남은 공간을 꽉 채움)
                const Expanded(
                  //
                  child: ChatTapListView(),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      // 키보드
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,

                      // 내용 입력창을 눌러야만 팝업
                      autofocus: true,
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
                        suffixIcon: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: IconButton(
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
                      ),
                      // 엔터버튼을 전송 아이콘으로 변경
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (value) {
                        print('전송: $value');
                        _controller.clear();
                      },
                    ),
                  ),
                ),
                // 메시지 입력 바 (Column의 가장 하단에 배치). 패키지인데 사용안함!
                // MessageBar(
                //   onSend: (text) => print('테스트:messages'),
                //   actions: [
                //     Padding(padding: const EdgeInsets.only(left: 6, right: 6)),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
