// presentation/bloc/todo_state.dart


import 'package:todoapp/domain/enities/todo_entity.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {
  TodoInitial() {
    print("TodoInitial state created");
  }
}

class TodoLoading extends TodoState {
  TodoLoading() {
    print("TodoLoading state created");
  }
}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todos;

  TodoLoaded({required this.todos});
}

class TodoError extends TodoState {
  final String message;

  TodoError({required this.message});
}
