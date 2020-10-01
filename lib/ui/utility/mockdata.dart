import 'package:flutter_messages_clone/models/message.dart';
import 'package:flutter/material.dart';
import 'dart:math';

List<MaterialColor> myCustomMaterialColors = <MaterialColor>[
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.blue,
  Colors.purple,
];
List<Message> data = [
  Message(
    from: "Tejas Trivedi",
    message: "Hey,wassup..!!",
    isRead: false,
    isInContactList: true,
    backgroundColor:
        myCustomMaterialColors[Random().nextInt(myCustomMaterialColors.length)],
  ),
  Message(
    from: "Smit Shah",
    message: "Sorry,was busy",
    isRead: false,
    isInContactList: true,
    backgroundColor:
        myCustomMaterialColors[Random().nextInt(myCustomMaterialColors.length)],
  ),
  Message(
    from: "Mom",
    message: "Where are you?",
    isRead: false,
    isInContactList: true,
    backgroundColor:
        myCustomMaterialColors[Random().nextInt(myCustomMaterialColors.length)],
  ),
  Message(
    from: "963808326",
    message: "Got it",
    isRead: true,
    isInContactList: false,
    backgroundColor:
        myCustomMaterialColors[Random().nextInt(myCustomMaterialColors.length)],
  ),
  Message(
    from: "Pranay",
    message: "I'll be there",
    isRead: true,
    isInContactList: true,
    backgroundColor:
        myCustomMaterialColors[Random().nextInt(myCustomMaterialColors.length)],
  ),
  Message(
      from: "7854862541",
      message: "2 Missed call",
      isRead: true,
      isInContactList: false,
      backgroundColor: myCustomMaterialColors[
          Random().nextInt(myCustomMaterialColors.length)]),
  Message(
      from: "Karan Sheth",
      message: "Thank you so much ::)",
      isRead: true,
      isInContactList: true,
      backgroundColor: myCustomMaterialColors[
          Random().nextInt(myCustomMaterialColors.length)]),
  Message(
      from: "Dad",
      message: "Call me later",
      isRead: true,
      isInContactList: true,
      backgroundColor: myCustomMaterialColors[
          Random().nextInt(myCustomMaterialColors.length)]),
  Message(
      from: "Barabarbaaz",
      message: "Got new earphones..",
      isRead: false,
      isInContactList: true,
      backgroundColor: myCustomMaterialColors[
          Random().nextInt(myCustomMaterialColors.length)]),
  Message(
      from: "8779296718",
      message: "Where were u? Tried calling u..",
      isRead: true,
      isInContactList: false,
      backgroundColor: myCustomMaterialColors[
          Random().nextInt(myCustomMaterialColors.length)]),
];

Future<List<Message>> loadData() async {
  return data;
}
