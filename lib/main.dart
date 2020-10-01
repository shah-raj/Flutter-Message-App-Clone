import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MessagesApp());
}

class MessagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Android Messages App Clone in Flutter.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        tooltipTheme: TooltipThemeData(
          margin: EdgeInsets.all(2),
          textStyle: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white
          ),
        ),
      ),
      home: Home(),
    );
  }
}
