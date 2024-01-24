// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/data/localization_methods.dart';

import 'package:todo_app/presentation/presentation_widgets.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({
    super.key,
  });

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const OnBoardingPageSlider(),
                Button(
                    width: 90,
                    height: 48,
                    color: const Color(0xff8875FF),
                    title: translation(context).skip,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, NavigatorClient.indexPage);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
