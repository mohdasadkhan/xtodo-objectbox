import 'package:dartz/dartz.dart';
import 'package:xtodo/core/core.dart';
import 'package:xtodo/src/todo/data/datasources/todo_data_api_impl.dart';
import 'package:xtodo/src/todo/data/datasources/todo_local_datasource.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource todoLocalDataSource;
  final TodoApiDataSource todoApiDataSource;
  final ErrorHandler errorHandler;

  TodoRepositoryImpl(
    this.todoLocalDataSource,
    this.errorHandler,
    this.todoApiDataSource,
  );

  @override
  Future<Either<Exception, List<TodoEntity>>> fetchTodosFromApi() async {
    return await errorHandler.guard<List<TodoEntity>>(() async {
      return todoApiDataSource.fetchApiTodos();
    });
  }

  @override
  Future<Either<Exception, List<TodoEntity>>> getAllTodos() async {
    return await errorHandler.guard<List<TodoEntity>>(() async {
      return todoLocalDataSource.getTodos();
    });
  }

  @override
  Future<Either<Exception, TodoEntity>> addTodo(TodoEntity todo) async {
    return errorHandler.guard<TodoEntity>(() async {
      return todoLocalDataSource.addTodo(todo);
    });
  }

  @override
  Future<Either<Exception, bool>> updateTodo(TodoEntity todo) async {
    return errorHandler.guard<bool>(() async {
      return todoLocalDataSource.updateTodo(todo);
    });
  }

  @override
  Future<Either<Exception, bool>> deleteTodo(int id) async {
    return errorHandler.guard<bool>(() async {
      return todoLocalDataSource.deleteTodo(id);
    });
  }
}
