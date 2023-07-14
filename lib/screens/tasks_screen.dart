import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

// ignore: must_be_immutable
class TasksScreens extends StatelessWidget {
  TasksScreens({super.key});

  List<Task> tasksList = [
    Task(title: 'Task1'),
    Task(title: 'Task2'),
    Task(title: 'Task3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(
              label: Text('Tasks:'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: (context, index) {
                var task = tasksList[index];
                return ListTile(
                  title: Text(task.title),
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {},
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
