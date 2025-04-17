// domain/repositories/todo_repository.dart
import 'package:todoapp/domain/enities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();
  Future<void> addTodo(String title, String description);
  Future<void> deleteTodo(String id);
  Future<void> editTodo(TodoEntity todo);
  Future<void> updateTodo(String id, String title, String description);
}
