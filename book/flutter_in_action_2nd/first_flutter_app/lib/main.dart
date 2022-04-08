import 'package:first_flutter_app/_2/route_manage.dart';
import 'package:first_flutter_app/_3/progress_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: "Flutter",
        initialRoute: '/',
        routes: {
        'new_page': (context) => const NewRoute(),
          '/': (context) => const ProgressIndicatorPage()
      },
        );
  }
}
