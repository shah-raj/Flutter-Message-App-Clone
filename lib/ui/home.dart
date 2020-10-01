import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_messages_clone/models/message.dart';
import 'package:flutter_messages_clone/ui/utility/mockdata.dart';
import 'utility/HexColor.dart';
import 'OptionMenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Message> messages = <Message>[];
  List<MaterialColor> myCustomMaterialColors = <MaterialColor>[];
  final random = Random();
  double _width = 56.0;
  bool isExtended = false;
  double appBarElevation = 0;
  bool isLoading = false;

  @override
  void initState() {
    // createSomePredefinedColors();
    createDummyData();
    super.initState();
  }

  // Predefined colors for random selection
  // Dummy Messages
  void createDummyData() async {
    setState(() {
      isLoading = true;
      messages = [];
    });
    await loadData().then((value) {
      value.forEach((element) {
        messages.add(element);
      });
    });
    print('Loaded all messages');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages',
            style: TextStyle(
                letterSpacing: -0.5,
                color: Colors.grey[800],
                fontFamily: 'Roboto')),
        elevation: appBarElevation,
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.search,
              color: Colors.grey[800],
            ),
          ),
          Container(
            child: OptionMenu(),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.refresh),
          onPressed: createDummyData,
        ),
      ),
      body: Stack(
        children: [
          showMessages(),
          showCircularProgress(),
        ],
      ),
      floatingActionButton: AnimatedContainer(
        height: 56,
        width: _width,
        duration: Duration(milliseconds: 180),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: HexColor("1A73E8"),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: isExtended
                      ? Text(
                          'Start chat',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      : SizedBox.shrink(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget showMessages() {
    return Container(
      color: Colors.white,
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is UserScrollNotification) {
            switch (scrollNotification.direction) {
              case ScrollDirection.reverse:
                _extendFab(true);
                break;
              case ScrollDirection.forward:
                _extendFab(false);
                break;
              case ScrollDirection.idle:
                break;
            }
          }
        },
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Hero(
                  tag: "$index",
                  child: CircleAvatar(
                    backgroundColor:
                        messages[index].backgroundColor.withOpacity(0.3),
                    radius: 23,
                    child: messages[index].isInContactList
                        ? Text(
                            '${messages[index].from.substring(0, 1)}',
                            style: TextStyle(
                              fontSize: 22,
                              color: messages[index].backgroundColor.shade800,
                            ),
                          )
                        : Icon(
                            Icons.person,
                            size: 30,
                            color: messages[index].backgroundColor.shade800,
                          ),
                  ),
                ),
                title: Text(
                  '${messages[index].from}',
                  style: TextStyle(
                    fontWeight: messages[index].isRead
                        ? FontWeight.normal
                        : FontWeight.bold,
                    color: messages[index].isRead ? null : Colors.black,
                  ),
                ),
                subtitle: Text(
                  '${messages[index].message}',
                  style: TextStyle(
                    fontWeight: messages[index].isRead
                        ? FontWeight.normal
                        : FontWeight.bold,
                    color: messages[index].isRead ? null : Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          body: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: "$index",
                                  child: CircleAvatar(
                                    backgroundColor: messages[index]
                                        .backgroundColor
                                        .withOpacity(0.3),
                                    radius: 40,
                                    child: messages[index].isInContactList
                                        ? Text(
                                            '${messages[index].from.substring(0, 1)}',
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: messages[index]
                                                  .backgroundColor
                                                  .shade800,
                                            ),
                                          )
                                        : Icon(
                                            Icons.person,
                                            size: 30,
                                            color: messages[index]
                                                .backgroundColor
                                                .shade800,
                                          ),
                                  ),
                                ),
                                Padding(
                                  child: Text(
                                    messages[index].message,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: messages[index].isRead
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: IconButton(
                                    color: Theme.of(context).primaryColorDark,
                                    tooltip: 'Go back',
                                    icon: Icon(Icons.arrow_back),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  Widget showCircularProgress() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  _extendFab(bool isExtend) {
    setState(() {
      isExtended = isExtend;
      _width = isExtended ? 135 : 56;
      appBarElevation = isExtend ? 5 : 0;
    });
  }
}

//TODO library match coding standard with pedro
//Different option for color
