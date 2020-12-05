import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_provider/model/todo.dart';
import 'package:todo_provider/utils/utils.dart';

class FirebaseApi {
  static CollectionReference _todoRef =
      FirebaseFirestore.instance.collection('todo');
  static Future<String> createTodo(Todo todo) async {
    final todoDoc = _todoRef.doc();
    todo.id = todoDoc.id;
    await todoDoc.set(todo.toJson());
    return todoDoc.id;
  }

  static Stream<List<Todo>> readTodos() => _todoRef
      .orderBy(TodoField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Todo.fromJson));

  static Future updateTodo(Todo todo) async {
    _todoRef.doc(todo.id).update(todo.toJson());
  }

  static Future deleteTodo(Todo todo) async {
    _todoRef.doc(todo.id).delete();
  }
}
