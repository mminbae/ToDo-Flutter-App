import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/tasks_list.dart';

import '../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class CompleteTasksScreen extends StatelessWidget {
  const CompleteTasksScreen({super.key});
  static const id = 'complete_task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completeTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${tasksList.length} Tasks'),
              ),
            ),
            TasksList(tasksList: tasksList)
          ],
        );
      },
    );
  }
}
