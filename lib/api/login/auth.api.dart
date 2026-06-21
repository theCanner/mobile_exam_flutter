import '../api.dart';

class Auth {
  final Api api = Api();

  Future<dynamic> login({required String username, required String pin}) {
    return api.post('/login', body: {'userName': username, 'otp': pin});
  }
}
