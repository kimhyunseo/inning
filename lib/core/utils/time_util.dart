String formatTime(DateTime time) {
  final hour = time.hour;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = hour < 12 ? '오전' : '오후';
  final hour12 = (hour % 12 == 0) ? 12 : hour % 12; // 0시/12시 처리
  return '$period ${hour12.toString().padLeft(2, '0')}:$minute';
}
