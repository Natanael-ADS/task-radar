import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final class AuthSession {
  static const String _accessTokenKey = 'auth.access_token';

  String? _accessToken;

  final FlutterSecureStorage _secureStorage;

  AuthSession(this._secureStorage);

  String? get accessToken => _accessToken;

  bool get isAuthenticated => _accessToken?.isNotEmpty ?? false;

  Future<void> hydrate() async {
    final savedAccessToken = await _secureStorage.read(key: _accessTokenKey);
    if (savedAccessToken?.isNotEmpty ?? false) {
      _accessToken = savedAccessToken;
    }
  }

  Future<void> saveAccessToken(String accessToken) async {
    _accessToken = accessToken;
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<void> clear() async {
    _accessToken = null;
    await _secureStorage.delete(key: _accessTokenKey);
  }
}
