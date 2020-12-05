import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/model/todo.dart';
import 'package:todo_provider/provider/todos.dart';
import 'package:todo_provider/widgets/todo_form_widget.dart';

class AddToDoDialog extends StatefulWidget {
  @override
  _AddToDoDialogState createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String desc = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add ToDo',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ToDoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDesc: (desc) => setState(() => this.desc = desc),
                onSavedTodo: addTodo,
              ),
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        createdTime: DateTime.now(),
        title: title,
        desc: desc,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.pop(context);
    }
  }
}
