import 'app_di.dart';
import 'modules/core_module.dart';
import 'modules/external_module.dart';
import 'modules/features_module.dart';

/// Registra dependências de aplicação em ordem estável.
Future<void> registerAppDependencies(AppDi sl) async {
  for (final registrar in _registrars) {
    await registrar(sl);
  }
}

typedef _AsyncRegistrar = Future<void> Function(AppDi sl);

final List<_AsyncRegistrar> _registrars = <_AsyncRegistrar>[
  registerCoreModule,
  registerExternalModule,
  registerFeaturesModule,
];
