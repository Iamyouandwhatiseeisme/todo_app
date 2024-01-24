import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/bloc/cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/data/localization_methods.dart';

import '../../presentation_widgets.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    super.key,
  });

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: IndexPageAppBar(),
        ),
        body: BlocConsumer<FetchTasksCubit, FetchTasksState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.props.isNotEmpty) {
              return const Center(
                child: Text('not empty'),
              );
            } else {
              return const Center(
                child: NoTasksYet(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          final fetcherCubit = BlocProvider.of<FetchTasksCubit>(context);
          fetcherCubit.fetchTasks();
        }),
      ),
    );
  }
}
