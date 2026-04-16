import '../entities/login_credentials.dart';
import '../entities/login_result.dart';
import '../repositories/auth_repository.dart';

final class LoginUseCase {
  final AuthRepository _authRepository;

  const LoginUseCase(this._authRepository);

  Future<LoginResult> call(LoginCredentials credentials) async {
    if (!credentials.isValid) {
      return const LoginResult.failure(LoginResult.invalidFieldsMessage);
    }

    if (await _authRepository.login(credentials)) {
      return const LoginResult.success();
    } else {
      return const LoginResult.failure(LoginResult.invalidCredentialsMessage);
    }
  }
}
