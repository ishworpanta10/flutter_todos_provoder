import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String title;
  final String desc;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDesc;
  final VoidCallback onSavedTodo;

  const ToDoFormWidget(
      {Key key,
      this.title,
      this.desc,
      this.onChangedTitle,
      this.onChangedDesc,
      this.onSavedTodo})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _buildTitle(),
          const SizedBox(height: 8),
          _buildDesc(),
          const SizedBox(height: 32.0),
          _buildButton(),
        ],
      );

  Widget _buildTitle() => TextFormField(
        initialValue: title,
        onChanged: onChangedTitle,
        maxLines: 1,
        validator: (title) => title.isEmpty ? 'Title can\'t be empty' : null,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget _buildDesc() => TextFormField(
        initialValue: desc,
        onChanged: onChangedDesc,
        maxLines: 3,
        // validator: (dec) => desc.isEmpty ? 'Description can\'t be empty' : null,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSavedTodo,
        child: Text(
          'Save',
        ),
      ),
    );
  }
}
