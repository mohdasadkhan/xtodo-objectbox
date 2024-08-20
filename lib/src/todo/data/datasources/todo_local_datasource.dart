import 'package:xtodo/core/error/exceptions.dart';
import 'package:xtodo/src/todo/data/datasources/todo_database_helper.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';

abstract interface class TodoLocalDataSource {
  Future<List<TodoEntity>> getTodos();

  Future<TodoEntity> addTodo(TodoEntity todo);

  Future<bool> updateTodo(TodoEntity todo);

  Future<bool> deleteTodo(int id);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final TodoDatabaseHelper todoDatabaseHelper;
  TodoLocalDataSourceImpl(this.todoDatabaseHelper);

  @override
  Future<List<TodoEntity>> getTodos() async {
    try {
      return await todoDatabaseHelper.getAllTodosLocal();
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }

  @override
  Future<TodoEntity> addTodo(TodoEntity todo) async {
    try {
      return await todoDatabaseHelper.insertTodoLocal(todo);
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }

  @override
  Future<bool> updateTodo(TodoEntity todo) async {
    try {
      return await todoDatabaseHelper.updateTodoLocal(todo);
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }

  @override
  Future<bool> deleteTodo(int id) async {
    try {
      return await todoDatabaseHelper.removeTodoLocal(id);
    } catch (e) {
      throw LocalServerException(e.toString());
    }
  }
}
