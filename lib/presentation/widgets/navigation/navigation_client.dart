import 'package:flutter/material.dart';
import 'package:todo_app/presentation/presentation_widgets.dart';

class NavigatorClient {
  static const String introPage = '/';

  final Map<String, WidgetBuilder> routes = {
    introPage: (context) => const IntroPage()
  };
}
