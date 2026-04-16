import '../../../../core/auth/auth_session.dart';
import '../../domain/entities/login_credentials.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthSession _authSession;

  const AuthRepositoryImpl(this._remoteDataSource, this._authSession);

  @override
  Future<bool> login(LoginCredentials credentials) async {
    final response = await _remoteDataSource.login(credentials);

    if (response.accessToken.isEmpty) return false;

    await _authSession.saveAccessToken(response.accessToken);

    return true;
  }

  @override
  Future<void> restoreSession() {
    return _authSession.hydrate();
  }

  @override
  Future<void> clearSession() {
    return _authSession.clear();
  }
}
