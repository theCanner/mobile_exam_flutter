import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'https://indexcodex.com/api/v1';

  Future<dynamic> post(String path, {Map<String, dynamic>? body}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      headers: {'CLIENT_ID': 'rgbexam', 'Content-Type': 'application/json'},
      body: jsonEncode(body ?? {}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    }

    throw Exception(
      data?['message'] ?? 'Request failed: ${response.statusCode}',
    );
  }
}
