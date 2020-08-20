import 'package:flutter/cupertino.dart';
import 'package:taskbook/services/auth_service.dart';
import 'package:taskbook/services/service_locator.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final AuthService _authService = serviceLocator<AuthService>();

  Future userLogout() async {
    await _authService.signOut();
  }
}
