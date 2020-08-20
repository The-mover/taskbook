import 'package:flutter/material.dart';
import 'package:taskbook/services/auth_service.dart';
import 'package:taskbook/services/service_locator.dart';

class SignupViewModel extends ChangeNotifier {
  final AuthService _authService = serviceLocator<AuthService>();

  Future<bool> userSignup(String email, String password) async {
    final result = await _authService.signUpWithEmail(email, password);
    if (result != null) return true;
    return false;
  }
}
