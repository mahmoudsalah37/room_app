import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_app/data/moor_database.dart';
import 'package:room_app/ui/home_page.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => AppDatabase(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
