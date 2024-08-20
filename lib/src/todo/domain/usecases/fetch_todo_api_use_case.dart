import 'package:dartz/dartz.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/domain/repositories/todo_repository.dart';

class FetchTodosFromApiUseCase {
  final TodoRepository _repository;

  FetchTodosFromApiUseCase(this._repository);

  Future<Either<Exception, List<TodoEntity>>> call() async {
    return await _repository.fetchTodosFromApi();
  }
}
