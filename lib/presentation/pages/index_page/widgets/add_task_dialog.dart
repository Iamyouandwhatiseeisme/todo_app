import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/cubit/cubits.dart';
import 'package:todo_app/data/data.dart';

import '../../../presentation_widgets.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({
    super.key,
  });

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  TimeOfDay timeNow = TimeOfDay.now();
  TimeOfDay? selectedTime;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Builder(
        builder: (context) {
          final height = MediaQuery.of(context).size.height / 1.5;
          final width = MediaQuery.of(context).size.width;
          return SizedBox(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Divider(
                    endIndent: 18,
                    thickness: 1,
                    color: Colors.white,
                  ),
                  TaskTexField(
                    hintText: 'Task Title',
                    textController: taskTitleController,
                  ),
                  TaskTexField(
                    hintText: 'Task Description',
                    textController: taskDescriptionController,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 18.0, top: 10, left: 10),
                    child: Container(
                      height: 20,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AddTaskDialogButtons(
                            icon: const Icon(Icons.alarm),
                            onTap: () async {
                              selectedTime = await showTimePicker(
                                  context: context, initialTime: timeNow);
                            },
                          ),
                          AddTaskDialogButtons(
                            icon: const Icon(Icons.date_range),
                            onTap: () async {
                              selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2015, 8),
                                lastDate: DateTime(2028),
                              );
                            },
                          ),
                          AddTaskDialogButtons(
                            icon: const Icon(Icons.flag_outlined),
                            onTap: () {},
                          ),
                          SizedBox(
                            width: width / 2.2,
                          ),
                          AddTaskDialogButtons(
                            icon: const Icon(
                              Icons.send_outlined,
                              color: Colors.blue,
                            ),
                            onTap: () {
                              BlocProvider.of<PostTasksCubit>(context)
                                  .postTasks(
                                taskModel: TaskModel(
                                    title: taskTitleController.text,
                                    description: taskDescriptionController.text,
                                    time:
                                        '${selectedTime!.hour.toString()}:${selectedTime!.minute.toString()}',
                                    priority: 8,
                                    id: DateTime.now().toString(),
                                    text: taskTitleController.text,
                                    completed: false,
                                    date: selectedDate!),
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddTaskDialogButtons extends StatelessWidget {
  final Function onTap;
  final Icon icon;
  const AddTaskDialogButtons({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      width: 40,
      height: 10,
      child: GestureDetector(
        onTap: () => onTap(),
        child: icon,
      ),
    );
  }
}

Future<dynamic> addTask(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const AddTaskDialog();
    },
  );
}
