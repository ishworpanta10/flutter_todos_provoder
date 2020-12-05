import 'package:flutter/widgets.dart';

class TodoField {
  static const String createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String id;
  String title;
  String desc;
  bool isDone;

  Todo({
    @required this.createdTime,
    this.id,
    @required this.title,
    this.desc,
    this.isDone = false,
  });
}
