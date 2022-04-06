import 'package:first_flutter_app/context.dart';
import 'package:first_flutter_app/stateless_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Flutter", home: ContextPage());
  }
}
