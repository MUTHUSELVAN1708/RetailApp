import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:retail_mobile/core/database/shared_prefs.dart';
import 'package:retail_mobile/core/network/api_endpoints.dart';

class ApiClient {
  Future<Map<String, String>> _getHeaders() async {
    String? token = await SharedPrefs.getToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  /// **GET request**
  Future<http.Response> getRequest(String endpoint) async {
    final url = Uri.parse('${ApiList.baseUrl}$endpoint');
    final headers = await _getHeaders();

    try {
      final response = await http.get(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  /// **POST request**
  Future<http.Response> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiList.baseUrl}$endpoint');
    final headers = await _getHeaders();

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to send data: $e');
    }
  }

  /// **PUT request**
  Future<http.Response> putRequest(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiList.baseUrl}$endpoint');
    final headers = await _getHeaders();

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }

  /// **DELETE request**
  Future<http.Response> deleteRequest(String endpoint) async {
    final url = Uri.parse('${ApiList.baseUrl}$endpoint');
    final headers = await _getHeaders();

    try {
      final response = await http.delete(url, headers: headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to delete data: $e');
    }
  }

  /// **Handles API response**
  http.Response _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print(response.body);
      return response;
    } else if (response.statusCode == 401) {
      print(response.body);
      throw Exception('Unauthorized: Invalid token or session expired.');
    } else {
      print(response.body);
      throw Exception('API Error: ${response.statusCode} - ${response.body}');
    }
  }
}
