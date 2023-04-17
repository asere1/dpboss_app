import 'package:http/http.dart' as http;

const String baseUrl = 'https://dpboss.net/';

class HttpService {
  static Future<String?> get() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
      );
      if (response.statusCode == 200) return response.body;
    } catch (e) {
      print('HttpService ${e.toString()}');
    }
    return null;
  }
}
