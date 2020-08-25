import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:taskbook/business_logic/models/todo.dart';
import 'package:taskbook/services/auth_service.dart';
import 'package:taskbook/services/firestore_service.dart';
import 'package:taskbook/services/service_locator.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final AuthService _authService = serviceLocator<AuthService>();
  final FirestoreService _firestoreService = serviceLocator<FirestoreService>();

  Future userLogout() async {
    await _authService.signOut();
  }

  Stream<List<Todo>> getTodos() {
    return _firestoreService.getTodos(_authService.getUserId);
  }

  void addTodo(Todo todo) async {
    await _firestoreService.addTodo(todo, _authService.getUserId);
    notifyListeners();
  }

  void updateTodo(Todo todo) async {
    await _firestoreService.updateTodo(todo, _authService.getUserId);
    notifyListeners();
  }

  void deleteTodo(Todo todo) async {
    await _firestoreService.deleteTodo(todo, _authService.getUserId);
    notifyListeners();
  }
}
