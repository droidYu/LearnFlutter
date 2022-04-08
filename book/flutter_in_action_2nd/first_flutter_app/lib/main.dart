import 'package:first_flutter_app/_2/route_manage.dart';
import 'package:first_flutter_app/_2/state_manage.dart';
import 'package:first_flutter_app/_2/widget.dart';
import 'package:first_flutter_app/_3/button.dart';
import 'package:first_flutter_app/_3/image_and_icon.dart';
import 'package:first_flutter_app/_3/input_and_form.dart';
import 'package:first_flutter_app/_3/progress_indicator.dart';
import 'package:first_flutter_app/_3/switch_and_checkbox.dart';
import 'package:first_flutter_app/_3/text.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = {
    'new_page': (context) => const NewRoute(),
    'widget': (context) => const StatelessWidgetRoute(),
    'context': (context) => const ContextRoute(),
    'state': (context) => const GetStateObjectRoute(),
    'cupertino': (context) => const CupertinoTestRoute(),
    'state_manage': (context) => const StateManageRoute(),
    'route': (context) => const FirstRoute(),
    'text': (context) => const TextPage(),
    'button': (context) => const ButtonPage(),
    'image': (context) => const ImageAndIconPage(),
    'switch': (context) => const SwitchAndCheckboxPage(),
    'input': (context) => const InputAndFormPage(),
    'progress': (context) => const ProgressIndicatorPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      initialRoute: '/',
      routes: routes,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Learn Flutter'),
          ),
          body: Builder(
            builder: (context) => ListView(
              children: ListTile.divideTiles(
                  context: context,
                  tiles: routes.keys.map((e) => ListTile(
                        title: GestureDetector(
                          child: Text(e),
                          onTap: () {
                            Navigator.pushNamed(context, e);
                          },
                        ),
                      ))).toList(),
            ),
          )),
    );
  }
}
