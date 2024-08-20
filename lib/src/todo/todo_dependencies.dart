part of 'package:xtodo/main_dependencies.dart';

void _initTodoDependencies() {
  serviceLocator

    ..registerLazySingleton(() => TodoDatabaseHelper())
    ..registerLazySingleton<TodoLocalDataSource>(
      () => TodoLocalDataSourceImpl(serviceLocator()),
    )
    ..registerLazySingleton(() => Dio())


    ..registerLazySingleton<TodoApiDataSource>(
      () => TodoApiDataSourceImpl(serviceLocator()),
    )
    ..registerLazySingleton(() => TodoApiDataHelper(serviceLocator()))

    ..registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(
          serviceLocator(), serviceLocator(), serviceLocator()),
    )

    ..registerFactory(() => GetAllTodosUseCase(serviceLocator()))
    ..registerFactory(() => AddTodoUseCase(serviceLocator()))
    ..registerFactory(() => UpdateTodoUseCase(serviceLocator()))
    ..registerFactory(() => DeleteTodoUseCase(serviceLocator()))
    ..registerFactory(() => FetchTodosFromApiUseCase(serviceLocator()))

    ..registerLazySingleton(
      () => TodoCubit(
        getAllTodosUseCase: serviceLocator(),
        addTodoUseCase: serviceLocator(),
        updateTodoUseCase: serviceLocator(),
        deleteTodoUseCase: serviceLocator(),
        fetchTodosFromApiUseCase: serviceLocator(),
      ),
    );
}
