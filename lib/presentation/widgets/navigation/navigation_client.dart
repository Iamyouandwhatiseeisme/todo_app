import 'package:flutter/material.dart';
import 'package:todo_app/presentation/presentation_widgets.dart';

class NavigatorClient {
  static const String introPage = '/';
  static const String onBoarding = 'onBoarding';
  static const String indexPage = 'indexPage';

  final Map<String, WidgetBuilder> routes = {
    introPage: (context) => const IntroPage(),
    onBoarding: (context) => const OnBoarding(),
    indexPage: (context) => const IndexPage()
  };
}
