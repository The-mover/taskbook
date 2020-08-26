import 'package:flutter/cupertino.dart';
import 'package:taskbook/business_logic/models/todo.dart';
import 'package:taskbook/services/auth_service.dart';
import 'package:taskbook/services/firestore_service.dart';
import 'package:taskbook/services/service_locator.dart';

class CreateTodoViewModel extends ChangeNotifier {
  final AuthService _authService = serviceLocator<AuthService>();
  final FirestoreService _firestoreService = serviceLocator<FirestoreService>();

  void addTodo(Todo todo) async {
    await _firestoreService.addTodo(todo, _authService.getUserId);
    notifyListeners();
  }
}
