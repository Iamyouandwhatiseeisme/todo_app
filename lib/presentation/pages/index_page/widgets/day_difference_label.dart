import 'package:flutter/material.dart';
import 'package:todo_app/data/data.dart';

class DayDifferenceLabel extends StatelessWidget {
  const DayDifferenceLabel({
    super.key,
    required this.listToDisplay,
    required this.index,
  });

  final List<TaskModel> listToDisplay;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(dayDifferenceCounter());
  }

  String dayDifferenceCounter() {
    String time = listToDisplay[index].time;
    String dayDifferenceInString;
    final dayDifferenceInInt = DateTime.utc(listToDisplay[index].date.year,
            listToDisplay[index].date.month, listToDisplay[index].date.day)
        .difference(DateTime.utc(
            DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .inDays;

    if (dayDifferenceInInt > 1) {
      dayDifferenceInString = 'In $dayDifferenceInInt days at $time';
    } else if (dayDifferenceInInt == 0) {
      dayDifferenceInString = 'Today at $time';
    } else if (dayDifferenceInInt == 1) {
      dayDifferenceInString = 'Tomorrow at $time';
    } else if (dayDifferenceInInt == -1) {
      dayDifferenceInString = 'Yesterday at $time';
    } else {
      dayDifferenceInString = '${dayDifferenceInInt * -1} days ago at $time';
    }

    return dayDifferenceInString;
  }
}
