import 'package:flutter/material.dart';

class DateTimeTestWidget extends StatelessWidget {
  const DateTimeTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    debugPrint('현재 시간 로컬: ${today.toLocal()}'); // 2023-09-16 11:14:50.333826
    debugPrint('현재 시간 UTC: ${today.toUtc()}'); // 2023-09-16 02:14:50.333826Z

    final tomorrow = today.add(const Duration(days: 1));
    final diff = tomorrow.difference(today);
    debugPrint('내일은 오늘과 며칠 차이? ${diff.inDays}'); // 1

    final todayDate = DateUtils.dateOnly(today);
    debugPrint('오늘 날짜: $todayDate'); // 2023-09-16 00:00:00.000

    return Container();
  }
}
