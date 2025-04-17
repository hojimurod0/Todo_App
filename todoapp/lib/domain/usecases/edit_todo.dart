import 'package:todoapp/domain/enities/todo_entity.dart';
import 'package:todoapp/domain/repositories/todo_repository.dart';

class EditTodo {
  final TodoRepository repo;

  EditTodo(this.repo);

  Future<void> call(TodoEntity todo) => repo.editTodo(todo);
}

// import 'package:todoapp/domain/repositories/todo_repository.dart';

// class EditTodo {
//   final TodoRepository repository;

//   EditTodo(this.repository);

//   Future<void> call(String id, String title, String describtion) =>
//       repository.updateTodo(id, title, describtion);
// }
