
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn flutter_redux',
      home: Scaffold(
        appBar: AppBar(title: Text('Learn flutter_redux'),),
      ),
    );
  }
}
