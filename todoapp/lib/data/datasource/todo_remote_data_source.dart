// data/datasources/todo_mock_api.dart
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/todo_model.dart';

//! api 

class TodoMockApi {
  final String baseUrl =
      'https://67fe8e1f58f18d7209eea61e.mockapi.io/TodoModel';

  //! malumotlarn olish uchun  get sorovi

  Future<List<TodoModel>> getTodos() async {
    log('Making GET request to: $baseUrl');
    try {
      final response = await http.get(Uri.parse(baseUrl));
      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        log('Decoded JSON: $jsonList');
        final todos = jsonList.map((json) => TodoModel.fromJson(json)).toList();
        log('Converted todos: $todos');
        return todos;
      } else {
        log('Failed to load todos. Status code: ${response.statusCode}');
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      log('Error in getTodos: $e');
      log('Error stack trace: ${StackTrace.current}');
      rethrow;
    }
  }

  //! malumotlarni qo'shish uchun post


  //! bu yerda TodoModel dan foydalanamiz

  Future<void> addTodo(String title, String description) async {
    log('Adding todo with title: $title, description: $description');
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title, 'description': description}),
      );
      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      if (response.statusCode != 201 && response.statusCode != 200) {
        throw Exception('Failed to add todo: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in addTodo: $e');
      rethrow;
    }
  }

  //! malumotlarni o'chirish uchun delete


  Future<void> deleteTodo(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo');
    }
  }

  //! malumotlarni yangilash uchun put


  Future<void> editTodo(TodoModel updatedTodo) async {
    log('Editing todo with id: ${updatedTodo.id}');
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${updatedTodo.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'title': updatedTodo.title,
          'description': updatedTodo.description,
        }),
      );
      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');
      if (response.statusCode != 200) {
        throw Exception('Failed to update todo: ${response.statusCode}');
      }
    } catch (e) {
      log('Error in editTodo: $e');
      rethrow;
    }
  }

  Future<void> updateTodo(String id, String title, String description) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'title': title, 'description': description}),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update todo: ${response.statusCode}');
    }
  }
}
