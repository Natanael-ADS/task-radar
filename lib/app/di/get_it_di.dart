import 'package:get_it/get_it.dart';

import 'app_di.dart';

/// Implementação do contrato [AppDi] usando `get_it`.
final class GetItDi implements AppDi {
  GetItDi(this._sl);

  final GetIt _sl;

  @override
  T get<T extends Object>({String? instanceName}) {
    return _sl.get<T>(instanceName: instanceName);
  }

  @override
  void registerFactory<T extends Object>(T Function() factoryFunc, {String? instanceName}) {
    _sl.registerFactory<T>(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() factoryFunc, {String? instanceName}) {
    _sl.registerLazySingleton<T>(factoryFunc, instanceName: instanceName);
  }

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    _sl.registerSingleton<T>(instance, instanceName: instanceName);
  }

  @override
  bool isRegistered<T extends Object>({String? instanceName}) {
    return _sl.isRegistered<T>(instanceName: instanceName);
  }

  @override
  Future<void> reset() {
    return _sl.reset();
  }
}

AppDi createGetItDi() => GetItDi(GetIt.instance);
