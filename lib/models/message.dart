import 'package:flutter/material.dart';

class Message {
  String from;
  String message;
  bool isRead;
  bool isInContactList;
  MaterialColor backgroundColor;

  Message({
    this.from,
    this.message,
    this.isRead,
    this.isInContactList,
    this.backgroundColor,
  });
  String get getFrom => this.from;
  String get getMessge => this.message;
  // bool get getRead => this.isRead;
}
