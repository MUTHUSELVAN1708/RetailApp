import 'package:retail_mobile/core/network/api_client.dart';
import 'dart:convert';

import 'package:retail_mobile/core/network/api_endpoints.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  Future<void> login(String email, String password) async {
    final response = await _apiClient
        .postRequest(ApiList.login, {'email': email, 'password': password});
    if (response.statusCode == 200) {
      // return UserModel.fromJson(json.decode(response.body));
    }
    return;
  }

  Future<void> register(String email, String password) async {
    final response = await _apiClient
        .postRequest(ApiList.register, {'email': email, 'password': password});
    if (response.statusCode == 200) {
      // return UserModel.fromJson(json.decode(response.body));
    }
    return;
  }
}
