import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/data/localization_methods.dart';

class NoTasksYet extends StatelessWidget {
  const NoTasksYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 86,
        ),
        SvgPicture.asset('assets/svg/icons/checklist.svg'),
        const SizedBox(
          height: 10,
        ),
        Text(
          translation(context).whatDoYouWantToDoToday,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          translation(context).tapPlusToAddYourTasks,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
