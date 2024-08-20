part of 'package:xtodo/main_dependencies.dart';

void _initCoreDependencies() {
  serviceLocator.registerLazySingleton<ErrorHandler>(
    () => ErrorHandlerImpl(),
  );
}
