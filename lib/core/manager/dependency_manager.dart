part of 'manager.dart';

class DependencyManager {
  static final GetIt _getIt = GetIt.instance;

  static void init() {
    _getIt.registerLazySingleton<UserRepository>(() => FirebaseUserRepo());
    log("initialized Successfully", name: "Dependency Manager");
  }

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
