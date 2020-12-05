import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider/todos.dart';
import 'package:todo_provider/widgets/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text('No Todos.'),
          )
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ToDoWidget(
                  todo: todo,
                ),
              );
            },
          );
  }
}
