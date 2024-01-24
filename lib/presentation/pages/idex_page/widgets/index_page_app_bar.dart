import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../data/localization_methods.dart';

class IndexPageAppBar extends StatelessWidget {
  const IndexPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0, left: 20, right: 20),
      child: AppBar(
        centerTitle: true,
        title: Text(
          translation(context).homePage,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        leading: Transform.scale(
          scale: 2,
          child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/icons/categories.svg',
              )),
        ),
      ),
    );
  }
}
