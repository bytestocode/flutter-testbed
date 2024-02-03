import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatelessWidget {
  const CustomTableCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      rowHeight: 30,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(
          color: Colors.red,
        ),
      ),
      calendarStyle: CalendarStyle(
        cellMargin: EdgeInsets.all(0),
        markerMargin: EdgeInsets.all(0),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          // final expense = getExpenseFor(day);
          final expense = 'ㅁ';

          return Center(
            child: Text(expense),
          );
        },
      ),
    );
  }
}
