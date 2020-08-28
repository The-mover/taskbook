import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskbook/business_logic/models/todo.dart';

class FirestoreService {
  final Firestore firestoreInstance = Firestore.instance;

  Stream<List<Todo>> getTodos(String userId) {
    return firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .orderBy('created')
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((doc) => Todo.fromJson(doc.data['todo'], doc.documentID))
            .toList());
  }

  Future addTodo(Todo todo, String userId) async {
    return await firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .add({'todo': todo.toJson(), 'created': FieldValue.serverTimestamp()});
  }

  Future updateTodo(Todo todo, String userId) async {
    return await firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .document(todo.id)
        .updateData({'todo': todo.toJson()});
  }

  Future deleteTodo(Todo todo, String userId) async {
    return await firestoreInstance
        .collection('users')
        .document(userId)
        .collection('todos')
        .document(todo.id)
        .delete()
        .catchError((e) => print(e.toString()));
  }
}
