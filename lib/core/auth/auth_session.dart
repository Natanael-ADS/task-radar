final class AuthSession {
  String? _accessToken;

  String? get accessToken => _accessToken;

  bool get isAuthenticated => _accessToken?.isNotEmpty ?? false;

  void saveAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  void clear() {
    _accessToken = null;
  }
}
