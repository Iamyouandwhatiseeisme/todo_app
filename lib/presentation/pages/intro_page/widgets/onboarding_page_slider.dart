import 'package:flutter/material.dart';
import 'package:todo_app/data/localization_methods.dart';

import '../../../presentation_widgets.dart';

class OnBoardingPageSlider extends StatefulWidget {
  const OnBoardingPageSlider({
    super.key,
  });

  @override
  State<OnBoardingPageSlider> createState() => _OnBoardingPageSliderState();
}

class _OnBoardingPageSliderState extends State<OnBoardingPageSlider> {
  List<String> images = [
    'onboarding first screen.svg',
    'onboarding second screen.svg',
    'onboarding third screen.svg'
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      translation(context).manageYourTasks,
      translation(context).createDailyRoutine,
      translation(context).organizeYourTasks,
    ];
    List<String> descriptions = [
      translation(context).manageYourTasksDescription,
      translation(context).createDailyRoutineDescription,
      translation(context).organizeYourTasksDescription,
    ];
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: SizedBox(
        height: 600,
        width: 600,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (_, index) {
            return Column(
              children: [
                BackgroundPhotoAndTitleWidget(
                    description: descriptions[index],
                    index: index,
                    pageTitle: titles[index],
                    photo: images[index]),
              ],
            );
          },
        ),
      ),
    );
  }
}
