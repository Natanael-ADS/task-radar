import '../repositories/auth_repository.dart';

final class RestoreSessionUseCase {
  final AuthRepository _authRepository;

  const RestoreSessionUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.restoreSession();
  }
}
