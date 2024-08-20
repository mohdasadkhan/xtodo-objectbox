import 'package:dartz/dartz.dart';
import 'package:xtodo/core/usecase/usecase.dart';
import 'package:xtodo/src/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUseCase implements FutureUseCase<bool, int> {
  final TodoRepository blogRepository;

  DeleteTodoUseCase(this.blogRepository);

  @override
  Future<Either<Exception, bool>> call(int id) async {
    return await blogRepository.deleteTodo(id);
  }
}
