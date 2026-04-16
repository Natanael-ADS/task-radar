final class LoginResult {
  static const String invalidCredentialsMessage = 'Credenciais invalidas.';
  static const String invalidFieldsMessage =
      'Username e password sao obrigatorios.';

  final bool isSuccess;
  final String? errorMessage;

  const LoginResult._({required this.isSuccess, required this.errorMessage});

  const LoginResult.success() : this._(isSuccess: true, errorMessage: null);

  const LoginResult.failure(String message)
    : this._(isSuccess: false, errorMessage: message);
}
