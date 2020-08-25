import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskbook/business_logic/models/todo.dart';

class FirestoreService {
  final Firestore firestoreInstance = Firestore.instance;

  Stream<List<Todo>> getTodos(String userId) {
    return firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((doc) => Todo.fromJson(doc.data, doc.documentID))
            .toList());
  }

  Future addTodo(Todo todo, String userId) async {
    final result = await firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .add(todo.toJson());
    return result;
  }

  Future updateTodo(Todo todo, String userId) {
    return firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .document(todo.id)
        .updateData(todo.toJson());
  }

  Future deleteTodo(Todo todo, String userId) {
    return firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .document(todo.id)
        .delete()
        .catchError((e) => print(e.toString()));
  }
}
