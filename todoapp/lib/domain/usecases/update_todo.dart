import 'package:todoapp/domain/enities/todo_entity.dart';
import 'package:todoapp/presentation/bloc/todo_event.dart';

import '../repositories/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<void> call(TodoEntity todo) => repository.updateTodo(
        todo.id, todo.title, todo.description);
}
