import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({
    super.key,
  });

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/svg/icons/Intro Icon.svg'),
              const Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
