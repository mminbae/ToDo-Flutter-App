// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completeTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTasks;
  const TasksState({
    this.removedTasks = const <Task>[],
    this.completeTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.pendingTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completeTasks, favoriteTasks, pendingTasks];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTasks': pendingTasks.map((x) => x.toMap()).toList(),
      'completeTasks': completeTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks:
          List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
      completeTasks:
          List<Task>.from(map['completeTasks']?.map((x) => Task.fromMap(x))),
      favoriteTasks:
          List<Task>.from(map['favoriteTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }

  // factory TasksState.fromMap(Map<String, dynamic> map) {
  //   return TasksState(
  //     pendingTasks: List<Task>.from(
  //       (map['pendingTasks'] as List<int>).map<Task>(
  //         (x) => Task.fromMap(x as Map<String, dynamic>),
  //       ),
  //     ),
  //   );
  // }
}
