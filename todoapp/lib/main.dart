import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Qo‘shiladi
import 'package:todoapp/presentation/bloc/todo_bloc.dart';
import 'package:todoapp/presentation/bloc/todo_event.dart';
import 'package:todoapp/domain/usecases/add_todo.dart';
import 'package:todoapp/domain/usecases/delete_todo.dart';
import 'package:todoapp/domain/usecases/edit_todo.dart';
import 'package:todoapp/domain/usecases/get_todos.dart';
import 'package:todoapp/data/repositories/todo_repository_impl.dart';
import 'package:todoapp/presentation/screens/todo_home_screen.dart';
import 'package:todoapp/data/datasource/todo_remote_data_source.dart';
import 'package:todoapp/presentation/screens/splash_screen.dart';

void main() {
  final todoRepository = TodoRepositoryImpl(TodoMockApi());
  runApp(MyApp(todoRepository: todoRepository));
}

class MyApp extends StatelessWidget {
  final TodoRepositoryImpl todoRepository;

  const MyApp({super.key, required this.todoRepository});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (_) => TodoBloc(
                    getTodos: GetTodos(todoRepository),
                    addTodo: AddTodo(todoRepository),
                    deleteTodo: DeleteTodo(todoRepository),
                    editTodo: EditTodo(todoRepository),
                  )..add(LoadTodos()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
