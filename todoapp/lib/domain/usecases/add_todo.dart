
// import '../repositories/todo_repository.dart';

// class AddTodo {
//   final TodoRepository repository;

//   AddTodo(this.repository);

//   Future<void> call(String title, String description) =>
//       repository.addTodo(title, description);
// }

import 'package:todoapp/domain/repositories/todo_repository.dart';

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(String title, String description) => 
      repository.addTodo(title, description);


}