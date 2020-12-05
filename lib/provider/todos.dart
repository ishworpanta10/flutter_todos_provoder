import 'package:flutter/widgets.dart';
import 'package:todo_provider/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Exercise for 10 minutes',
      desc: '''
        - Run
        - Jumping 
        
         ''',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.isDone == true).toList();

  //add new todos
  addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  //remove todo
  removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  //toggle todo completed
  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  //update todo
  updateTodo(Todo todo, String title, String desc) {
    todo.title = title;
    todo.desc = desc;
    notifyListeners();
  }
}
