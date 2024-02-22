import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/cubit/cubits.dart';
import 'package:todo_app/bloc/cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/data/data.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/presentation/widgets/custom_bottom_navigatio_bar_widget.dart';

import '../../presentation_widgets.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    super.key,
  });

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<TaskModel> listToDisplay = [];
  @override
  Widget build(BuildContext context) {
    final containerColor = Theme.of(context).colorScheme.secondary;
    // ignore: prefer_const_constructors
    return SafeArea(
      child: BlocListener<PostTasksCubit, PostTasksState>(
        listener: (context, state) {
          if (state is PostTasksLoaded) {
            BlocProvider.of<FetchTasksCubit>(context).fetchTasks();
          }
        },
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
              width: 64,
              height: 64,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(width: 3, color: containerColor)),
                onPressed: () {
                  addTask(context);
                },
                elevation: 0,
                backgroundColor: containerColor,
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              )),
          bottomNavigationBar: sl.get<CustomBottomNavigationBar>(),
          appBar: const PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: IndexPageAppBar(),
          ),
          body: BlocConsumer<FetchTasksCubit, FetchTasksState>(
            listener: (context, state) {
              if (state is FetchTasksLoaded) {
                listToDisplay = state.listOfTasks;
              }
            },
            builder: (context, state) {
              if (state is FetchTasksLoaded) {
                if (state.listOfTasks.isNotEmpty) {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return TaskCard(
                              index: index, listToDisplay: listToDisplay);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: listToDisplay.length),
                  ));
                } else {
                  return const Center(child: NoTasksYet());
                }
              } else if (state is FetchTasksLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(
                  child: NoTasksYet(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
