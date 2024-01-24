import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../presentation_widgets.dart';

class BackgroundPhotoAndTitleWidget extends StatelessWidget {
  final String pageTitle;
  final String description;
  final String photo;
  final int index;
  const BackgroundPhotoAndTitleWidget({
    super.key,
    required this.pageTitle,
    required this.photo,
    required this.index,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/svg/icons/$photo',
          ),
          const SizedBox(
            height: 48,
          ),
          SliderDots(
            index: index,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            pageTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
