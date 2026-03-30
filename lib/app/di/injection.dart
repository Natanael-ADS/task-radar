import 'app_di.dart';
import 'get_it_di.dart';
import 'registrars.dart';

/// Instância global de DI consumida pelo app.
final AppDi getIt = createGetItDi();

/// Registra dependências uma vez, antes do [runApp].
Future<void> configureDependencies() async {
  await registerAppDependencies(getIt);
}
