import 'package:dartz/dartz.dart';
import 'package:xtodo/core/usecase/usecase.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/domain/repositories/todo_repository.dart';

class UpdateTodoUseCase implements FutureUseCase<bool, TodoEntity> {
  final TodoRepository blogRepository;

  UpdateTodoUseCase(this.blogRepository);

  @override
  Future<Either<Exception, bool>> call(TodoEntity todoModel) async {
    return await blogRepository.updateTodo(todoModel);
  }
}
