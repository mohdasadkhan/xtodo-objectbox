import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xtodo/core/core.dart';
import 'package:xtodo/src/todo/data/datasources/todo_api_helper.dart';
import 'package:xtodo/src/todo/data/datasources/todo_data_api_impl.dart';
import 'package:xtodo/src/todo/data/datasources/todo_database_helper.dart';
import 'package:xtodo/src/todo/data/datasources/todo_local_datasource.dart';
import 'package:xtodo/src/todo/data/repositories/todo_repository_impl.dart';
import 'package:xtodo/src/todo/domain/repositories/todo_repository.dart';
import 'package:xtodo/src/todo/domain/usecases/add_todo_use_case.dart';
import 'package:xtodo/src/todo/domain/usecases/delete_todo_use_case.dart';
import 'package:xtodo/src/todo/domain/usecases/fetch_todo_api_use_case.dart';
import 'package:xtodo/src/todo/domain/usecases/get_all_todos_use_case.dart';
import 'package:xtodo/src/todo/domain/usecases/update_todo_use_case.dart';
import 'package:xtodo/src/todo/presentation/cubit/todo_cubit.dart';

part 'package:xtodo/core/core_dependencies.dart';
part 'package:xtodo/src/todo/todo_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCoreDependencies();
  _initTodoDependencies();
}
