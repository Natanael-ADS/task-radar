import '../app_di.dart';

Future<void> registerCoreModule(AppDi sl) async {
  // Colocar aqui dependências transversais do app (ex.: clients compartilhados,
  // mapeadores, utilitários de domínio, etc.).
  //
  // Exemplos (quando existirem tipos no projeto):
  // sl.registerLazySingleton<NetworkClient>(() => NetworkClientImpl());
}
