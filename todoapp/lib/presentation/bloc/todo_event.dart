// // presentation/bloc/todo_event.dart

import 'package:todoapp/domain/enities/todo_entity.dart';

abstract class TodoEvent {
  TodoEvent() {
    print("TodoEvent created");
  }
}

class LoadTodos extends TodoEvent {
  LoadTodos() {
    print("LoadTodos event created");
  }
}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String description;

  AddTodoEvent({required this.title, required this.description});
}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;

  UpdateTodoEvent({required this.todo});
}

class DeleteTodoEvent extends TodoEvent {
  final String id;

  DeleteTodoEvent({required this.id});
}
