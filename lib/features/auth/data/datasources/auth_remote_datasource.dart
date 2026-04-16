import 'package:dio/dio.dart';

import '../../../../app/network/api_constants.dart';
import '../../domain/entities/login_credentials.dart';
import '../models/login_response_model.dart';

final class AuthRemoteDataSource {
  final Dio _dio;

  const AuthRemoteDataSource(this._dio);

  Future<LoginResponseModel> login(LoginCredentials credentials) async {
    final response = await _dio.post<Map<String, dynamic>>(
      ApiConstants.loginPath,
      data: <String, String>{
        'username': credentials.username,
        'password': credentials.password,
      },
    );

    return LoginResponseModel.fromJson(response.data ?? <String, dynamic>{});
  }
}
