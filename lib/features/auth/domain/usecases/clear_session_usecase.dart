import '../repositories/auth_repository.dart';

final class ClearSessionUseCase {
  final AuthRepository _authRepository;

  const ClearSessionUseCase(this._authRepository);

  Future<void> call() {
    return _authRepository.clearSession();
  }
}
