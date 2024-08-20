import 'package:dartz/dartz.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';

abstract interface class TodoRepository {
  Future<Either<Exception, List<TodoEntity>>> fetchTodosFromApi();

  Future<Either<Exception, TodoEntity>> addTodo(TodoEntity todo);

  Future<Either<Exception, bool>> updateTodo(TodoEntity todo);

  Future<Either<Exception, bool>> deleteTodo(int id);

  Future<Either<Exception, List<TodoEntity>>> getAllTodos();
}
