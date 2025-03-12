import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api'));
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool> register({
    String? email,
    String? phone,
    String firstName = "",
    String lastName = "",
  }) async {
    try {
      if ((email == null || email.isEmpty) ==
          (phone == null || phone.isEmpty)) {
        throw Exception("Either email or phone must be provided, not both.");
      }

      final response = await _dio.post(
        '/register',
        data: {
          if (email != null && email.isNotEmpty) 'email': email,
          if (phone != null && phone.isNotEmpty) 'phone': phone,
          'first_name': firstName,
          'last_name': lastName,
        },
      );

      return response.statusCode == 201;
    } catch (e) {
      print("Register Error: $e");
    }
    return false;
  }

  Future<bool> login(String identifier) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {'identifier': identifier},
      );

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
        await _dio.post(
          '/logout',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
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


  Future<bool> registerWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        print("Google Sign-In aborted by user.");
        return false;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        print("Google Sign-In Email: ${user.email}");

        try {
          final response = await _dio.post(
            '/register/google',
            data: {'email': user.email, 'name': user.displayName},
          );

          if (response.statusCode == 200) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', response.data['access_token']);
            return true;
          } else {
            print("Backend Registration Failed: ${response.statusCode}");
          }
        } catch (backendError) {
          print("Backend Error: $backendError");
        }
      }
    } catch (e) {
      print("Google Sign-In Error: $e");
    }
    return false;
  }

  Future<bool> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success) {
        print("Facebook Sign-In failed: ${loginResult.message}");
        return false;
      }

      final userData = await FacebookAuth.instance.getUserData();
      final String? email = userData['email'];
      final String? name = userData['name'];

      if (email == null) {
        print("Facebook login failed: Email not found.");
        return false;
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final User? user = userCredential.user;

      if (user != null) {
        print("Facebook Sign-In Email: ${user.email}");

        try {
          final response = await _dio.post(
            '/register/facebook',
            data: {'email': email, 'name': name},
          );

          if (response.statusCode == 200) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', response.data['access_token']);
            return true;
          } else {
            print("Backend Registration Failed: ${response.statusCode}");
          }
        } catch (backendError) {
          print("Backend Error: $backendError");
        }
      }
    } catch (e) {
      print("Facebook Sign-In Error: $e");
    }
    return false;
  }

  Future<UserCredential?> signInWithApple() async {
  final FirebaseAuth auth = FirebaseAuth.instance;

  if (Platform.isIOS) {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    return await auth.signInWithCredential(oauthCredential);
  } else {
    print("Apple Sign-In is only available on iOS");
    return null;
  }
}
}
