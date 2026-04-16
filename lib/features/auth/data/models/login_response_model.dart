final class LoginResponseModel {
  final String accessToken;

  LoginResponseModel.fromJson(Map<String, dynamic> json)
    : accessToken = json['accessToken'] ?? '';
}
