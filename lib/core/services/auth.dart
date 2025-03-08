import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:8000/api'));

  Future<bool> register({String? email, String? phone, String firstName = "", String lastName = ""}) async {
    try {
      if ((email == null || email.isEmpty) == (phone == null || phone.isEmpty)) {
        throw Exception("Either email or phone must be provided, not both.");
      }

      final response = await _dio.post('/register', data: {
        if (email != null && email.isNotEmpty) 'email': email,
        if (phone != null && phone.isNotEmpty) 'phone': phone,
        'first_name': firstName,
        'last_name': lastName,
      });

      return response.statusCode == 201;
    } catch (e) {
      print("Register Error: $e");
    }
    return false;
  }

  Future<bool> login(String identifier) async {
    try {
      final response = await _dio.post('/login', data: {
        'identifier': identifier, 
      });

      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return true;
      }
    } catch (e) {
      print("Login Error: $e");
    }
    return false;
  }

  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        await _dio.post('/logout',
            options: Options(headers: {'Authorization': 'Bearer $token'}));
        await prefs.remove('token');
      }
    } catch (e) {
      print("Logout Error: $e");
    }
  }

  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }
}
