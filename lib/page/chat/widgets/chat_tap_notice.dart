import 'package:flutter/material.dart';

/// 공지사항 팝업
class ChatTapNotice extends StatelessWidget {
  const ChatTapNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
    );
  }
}
