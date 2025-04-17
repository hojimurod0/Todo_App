// presentation/bloc/todo_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:todoapp/presentation/bloc/todo.state.dart';
import '../../domain/usecases/get_todos.dart';
import '../../domain/usecases/add_todo.dart';
import '../../domain/usecases/delete_todo.dart';
import '../../domain/usecases/edit_todo.dart';
import 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final DeleteTodo deleteTodo;
  final EditTodo editTodo;

  TodoBloc({
    required this.getTodos,
    required this.addTodo,
    required this.deleteTodo,
    required this.editTodo,
  }) : super(TodoInitial()) {

    on<LoadTodos>((event, emit) async {
      print('Loading todos...');
      emit(TodoLoading());
      try {
        print('Calling getTodos...');
        final todos = await getTodos.call();
        print('Loaded ${todos.length} todos');
        print('Todos: $todos');
        emit(TodoLoaded(todos: todos));
      } catch (e) {
        print('Error loading todos: $e');
        print('Error stack trace: ${StackTrace.current}');
        emit(TodoError(message: e.toString()));
      }
    });


    on<AddTodoEvent>((event, emit) async {
      print('Adding todo: ${event.title}');
      try {
        await addTodo.call(event.title, event.description);
        print('Todo added successfully');
        add(LoadTodos());
      } catch (e) {
        print('Error adding todo: $e');
        emit(TodoError(message: e.toString()));
      }
    });

  
    on<UpdateTodoEvent>((event, emit) async {
      print('Updating todo: ${event.todo.id}');
      try {
        await editTodo.call(event.todo);
        print('Todo updated successfully');
        add(LoadTodos());
      } catch (e) {
        print('Error updating todo: $e');
        emit(TodoError(message: e.toString()));
      }
    });


    on<DeleteTodoEvent>((event, emit) async {
      print('Deleting todo: ${event.id}');
      try {
        await deleteTodo.call(event.id);
        print('Todo deleted successfully');
        add(LoadTodos());
      } catch (e) {
        print('Error deleting todo: $e');
        emit(TodoError(message: e.toString()));
      }
    });
  }
}
