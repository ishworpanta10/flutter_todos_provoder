import 'package:flutter/widgets.dart';
import 'package:todo_provider/utils/utils.dart';

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

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        createdTime: Utils.toDateTime(json['createdTime']),
        title: json['title'],
        id: json['id'],
        desc: json['description'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'id': id,
        'title': title,
        'description': desc,
        'isDone': isDone,
      };
}
