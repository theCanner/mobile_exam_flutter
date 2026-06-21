import '../api.dart';

class Dashboard {
  final Api api = Api();
  Future<dynamic> getItems() {
    return api.get('/socials');
  }
}
