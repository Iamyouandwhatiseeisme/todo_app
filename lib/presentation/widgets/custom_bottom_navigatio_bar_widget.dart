// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/bloc/cubit/cubits.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavigationCubit =
        BlocProvider.of<BottomNavigationBarCubit>(context);
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, currentIndex) {
        return Theme(
          data: ThemeData(canvasColor: Theme.of(context).colorScheme.surface),
          child: BottomNavigationBar(
              showSelectedLabels: false,
              unselectedItemColor: const Color(0xfff3f0e6).withOpacity(0.5),
              selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
              currentIndex: currentIndex.currentIndex,
              onTap: (index) {
                bottomNavigationCubit.changeTab(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/icons/index.svg',
                    height: currentIndex.currentIndex == 0 ? 25 : 20,
                  ),
                  label: "Index",
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: SvgPicture.asset(
                        'assets/svg/icons/calendar.svg',
                        height: currentIndex.currentIndex == 1 ? 25 : 20,
                      ),
                    ),
                    label: 'Calendar'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: SvgPicture.asset(
                        'assets/svg/icons/focuse.svg',
                        height: currentIndex.currentIndex == 2 ? 25 : 20,
                      ),
                    ),
                    label: 'Focuse'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/icons/profile.svg',
                      height: currentIndex.currentIndex == 3 ? 25 : 20,
                    ),
                    label: 'Profile'),
              ]),
        );
      },
    );
  }
}
