import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: Scaffold(
        appBar: AppBar(title:const Text("Flutter"),),
        body:const Center(child: Text("Hello Flutter!"),),
      ),
    );
  }
}
