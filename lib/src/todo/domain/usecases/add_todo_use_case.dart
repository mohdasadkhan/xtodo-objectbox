import 'package:dartz/dartz.dart';
import 'package:xtodo/core/usecase/usecase.dart';
import 'package:xtodo/src/todo/domain/entities/todo_entity.dart';
import 'package:xtodo/src/todo/domain/repositories/todo_repository.dart';

class AddTodoUseCase implements FutureUseCase<TodoEntity, TodoEntity> {
  final TodoRepository blogRepository;

  AddTodoUseCase(this.blogRepository);

  @override
  Future<Either<Exception, TodoEntity>> call(TodoEntity todoModel) async {
    return await blogRepository.addTodo(todoModel);
  }
}
