// data/repositories/todo_repository_impl.dart
import 'package:todoapp/data/datasource/todo_remote_data_source.dart';
import 'package:todoapp/domain/enities/todo_entity.dart';

import '../../domain/repositories/todo_repository.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoMockApi api;

  TodoRepositoryImpl(this.api);

  @override
  Future<List<TodoEntity>> getTodos() async {
    final todos = await api.getTodos();
    return todos
        .map(
          (todo) => TodoEntity(
            id: todo.id,
            title: todo.title,
            description: todo.description,
          ),
        )
        .toList();
  }

  @override
  Future<void> addTodo(String title, String description) =>
      api.addTodo(title, description);

  @override
  Future<void> deleteTodo(String id) => api.deleteTodo(id);

  @override
  Future<void> editTodo(TodoEntity todo) => api.editTodo(
    TodoModel(id: todo.id, title: todo.title, description: todo.description),
  );

  // update

  @override
  Future<void> updateTodo(String id, String title, String description) =>
      api.updateTodo(id, title, description);
}
