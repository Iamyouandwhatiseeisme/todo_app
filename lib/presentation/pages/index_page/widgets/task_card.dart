import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/data.dart';
import '../../../presentation_widgets.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.listToDisplay,
    required this.index,
  });

  final List<TaskModel> listToDisplay;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 72,
        width: 327,
        color: const Color(0xff363636),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset('assets/svg/icons/Ellipse 15.svg'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 266,
                    child: Text(
                      listToDisplay[index].title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                      width: 266,
                      height: 20,
                      child: Row(
                        children: [
                          DayDifferenceLabel(
                              index: index, listToDisplay: listToDisplay)
                        ],
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 4),
              height: 29,
              width: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/svg/icons/flag.svg'),
                    Text('${listToDisplay[index].priority}')
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
