import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/model/todo.dart';
import 'package:todo_provider/provider/todos.dart';
import 'package:todo_provider/widgets/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String title;
  String desc;

  // title always filled
  final _formKey = GlobalKey<FormState>();

  // pre populate todos data
  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    desc = widget.todo.desc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<TodosProvider>(context, listen: false);
              provider.removeTodo(widget.todo);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ToDoFormWidget(
            title: title,
            desc: desc,
            onChangedTitle: (title) {
              setState(() {
                this.title = title;
              });
            },
            onChangedDesc: (desc) {
              setState(() {
                this.desc = desc;
              });
            },
            onSavedTodo: () => saveTodo(),
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, desc);
      Navigator.pop(context);
    }
  }
}
