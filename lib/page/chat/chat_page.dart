import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/core/app_color.dart';
import 'package:inning/core/fonts.dart';
import 'package:inning/core/model/stadium.dart';
import 'package:inning/core/widgets/common_app_bar.dart';
import 'package:inning/page/chat/chat_view_model.dart';
import 'package:inning/page/chat/widgets/chat_tap_list_view.dart';
import 'package:inning/page/chat/widgets/chat_tap_notice.dart';

class ChatPage extends ConsumerStatefulWidget {
  final Stadium currentStadium;

  const ChatPage({super.key, required this.currentStadium});
  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _focusNode = FocusNode();

    // TODO: 구독 시작 (안되면 고치기)
    Future.microtask(() {
      ref
          .read(chatViewModelProvider.notifier)
          .watchChat(widget.currentStadium.id);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _onSubmit() {
      if (_controller.text.trim().isNotEmpty) {
        final vm = ref.read(chatViewModelProvider.notifier);
        vm.sendMessage(
          stadiumId: widget.currentStadium.id,
          content: _controller.text,
        );
        // 전송 후 입력칸 비움
        _controller.clear();
      }
    }

    return GestureDetector(
      // 빈 화면 터치시 키보드 사라짐
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.brandPopUp,
        resizeToAvoidBottomInset: true,

        appBar: CommonAppBar(
          title: '경기 관람 채팅방',
          actionIcon: Icons.info_outline,
        ),

        body: SafeArea(
          child: Column(
            children: [
              // 공지사항 영역
              // const ChatTapNotice(),

              // 채팅 리스트 영역 (남은 공간을 꽉 채움)
              Expanded(
                //
                child: ChatTapListView(stadiumId: widget.currentStadium.id),
              ),

              // 입력 필드
              Padding(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
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
                        _onSubmit();
                      },
                      icon: Icon(Icons.send, color: AppColors.brandPoint),
                    ),
                  ),
                  // 엔터버튼을 전송 아이콘으로 변경
                  textInputAction: TextInputAction.newline,
                  onFieldSubmitted: (value) {
                    _onSubmit();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
