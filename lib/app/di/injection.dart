import 'app_di.dart';
import 'get_it_di.dart';
import 'registrars.dart';

/// Ponto único de acesso ao container de DI da aplicação.
final AppDi injector = createGetItDi();

/// Executa o registro de dependências no bootstrap do app.
Future<void> configureDependencies() async {
  await registerAppDependencies(injector);
}
