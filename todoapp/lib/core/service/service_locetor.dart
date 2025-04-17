// // lib/core/service_locator.dart
// import 'package:get_it/get_it.dart';
// import 'package:todoapp/data/datasource/todo_remote_data_source.dart';
// import 'package:todoapp/data/repositories/todo_repository_impl.dart';
// import 'package:todoapp/domain/usecases/add_todo.dart';
// import 'package:todoapp/domain/usecases/delete_todo.dart';
// import 'package:todoapp/domain/usecases/edit_todo.dart';
// import 'package:todoapp/domain/usecases/get_todos.dart';
// import 'package:todoapp/presentation/bloc/todo_bloc.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // ✅ Data source
//   sl.registerLazySingleton<TodoMockApi>(() => TodoMockApi());

//   // ✅ Repository
//   sl.registerLazySingleton(() => TodoRepositoryImpl(sl()));

//   // ✅ Usecases
//   sl.registerLazySingleton(() => GetTodos(sl()));
//   sl.registerLazySingleton(() => AddTodo(sl()));
//   sl.registerLazySingleton(() => DeleteTodo(sl()));
//   sl.registerLazySingleton(() => EditTodo(sl()));

//   // ✅ Bloc
//   sl.registerFactory(() => TodoBloc(
//         getTodos: sl(),
//         addTodo: sl(),
//         deleteTodo: sl(),
//         editTodo: sl(),
//       ));
// }

import 'package:get_it/get_it.dart';
import 'package:todoapp/data/datasource/todo_remote_data_source.dart';
import 'package:todoapp/data/repositories/todo_repository_impl.dart';
import 'package:todoapp/domain/usecases/add_todo.dart';
import 'package:todoapp/domain/usecases/delete_todo.dart';
import 'package:todoapp/domain/usecases/edit_todo.dart';
import 'package:todoapp/domain/usecases/get_todos.dart';
import 'package:todoapp/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<TodoMockApi>(() => TodoMockApi());

  sl.registerLazySingleton(() => TodoRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetTodos(sl()));
  sl.registerLazySingleton(() => AddTodo(sl()));
  sl.registerLazySingleton(() => DeleteTodo(sl()));
  sl.registerLazySingleton(() => EditTodo(sl()));

  sl.registerFactory(
    () => TodoBloc(
      getTodos: sl(),
      addTodo: sl(),
      deleteTodo: sl(),
      editTodo: sl(),
    ),
  );
}
