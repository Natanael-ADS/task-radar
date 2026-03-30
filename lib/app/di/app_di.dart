/// Contrato de DI do app.
///
/// A aplicação depende desta abstração, não do `get_it` diretamente.
abstract interface class AppDi {
  T get<T extends Object>({String? instanceName});

  void registerFactory<T extends Object>(T Function() factoryFunc, {String? instanceName});

  void registerLazySingleton<T extends Object>(T Function() factoryFunc, {String? instanceName});

  void registerSingleton<T extends Object>(T instance, {String? instanceName});

  bool isRegistered<T extends Object>({String? instanceName});

  Future<void> reset();
}
