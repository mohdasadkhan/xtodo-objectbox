import 'package:dio/dio.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';

class TodoApiDataHelper {
  final Dio dio;
  TodoApiDataHelper(this.dio);

  Future<List<TodoEntity>> fetchTodosFromApi() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data
            .map((json) => TodoEntity(
                id: json['id'],
                task: json['title'],
                description: json['title'],
                isCompleted: json['completed'],
                createdAt: DateTime.now()))
            .toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error fetching todos: $e');
    }
  }
}
