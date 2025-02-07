import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiList {
  static String baseUrl = dotenv.env['API_KEY'] ?? '';

  static String login = 'login';
  static String register = 'register';
}
