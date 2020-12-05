import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(text),
          ),
        );

//from json to datetime

  static DateTime toDateTime(Timestamp value) {
    if (value == null) return null;
    return value.toDate();
  }

//from date time to json
  static dynamic fromDateTimeToJson(DateTime dateTime) {
    if (dateTime == null) return null;
    return dateTime.toUtc();
  }

  // stream transformer
  static StreamTransformer transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
          handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
        final snap = data.docs.map((doc) => doc.data()).toList();
        final object = snap.map((json) => fromJson(json)).toList();
        sink.add(object);
      });
}
