import 'package:flutter/widgets.dart';
import 'package:todo_provider/api/firebase_api.dart';
import 'package:todo_provider/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.isDone == true).toList();

  //add new todos
  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);
  //  {
  //   _todos.add(todo);
  //   notifyListeners();
  // }

  void setTodos(List<Todo> todo) =>
      // this widget binding post call back  helps to called this after the build method is completed in homepage and update the ui
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _todos = todo;
        notifyListeners();
      });

  //remove todo
  void removeTodo(Todo todo) => FirebaseApi.deleteTodo(todo);
  // {
  //   _todos.remove(todo);
  //   notifyListeners();
  // }

  //toggle todo completed
  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FirebaseApi.updateTodo(todo);
    // notifyListeners();
    return todo.isDone;
  }

  //update todo
  updateTodo(Todo todo, String title, String desc) {
    todo.title = title;
    todo.desc = desc;
    FirebaseApi.updateTodo(todo);
    // notifyListeners();
  }
}
