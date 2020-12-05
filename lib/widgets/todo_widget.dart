import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/model/todo.dart';
import 'package:todo_provider/pages/edit_page.dart';
import 'package:todo_provider/provider/todos.dart';
import 'package:todo_provider/utils/utils.dart';

class ToDoWidget extends StatelessWidget {
  final Todo todo;

  const ToDoWidget({this.todo});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableBehindActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              icon: Icons.edit,
              caption: 'Edit',
              color: Colors.green,
              onTap: () => editTodo(context, todo),
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              caption: 'Delete',
              color: Colors.red,
              onTap: () => deleteTodo(context, todo),
            )
          ],
          child: _buildTodo(context),
        ),
      );

  Widget _buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditTodoPage(
            todo: todo,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);
                Utils.showSnackBar(
                  context,
                  isDone ? 'Task Completed !' : 'Task marked incompleted',
                );
              },
              value: todo.isDone,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  if (todo.desc.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: Text(
                        todo.desc,
                        style: TextStyle(fontSize: 20, height: 1.5),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task !');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => EditTodoPage(todo: todo),
        ),
      );
}
