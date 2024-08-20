import 'package:xtodo/core/core.dart';
import 'package:xtodo/src/todo/data/datasources/todo_api_helper.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';

abstract interface class TodoApiDataSource {
  Future<List<TodoEntity>> fetchApiTodos();
}

class TodoApiDataSourceImpl implements TodoApiDataSource {
  final TodoApiDataHelper todoApiDataHelper;
  TodoApiDataSourceImpl(
    this.todoApiDataHelper,
  );

  @override
  Future<List<TodoEntity>> fetchApiTodos() async {
    try {
      return await todoApiDataHelper.fetchTodosFromApi();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
