import 'package:flutter/material.dart';
import 'package:learn_flutter/_2/route_manage.dart';
import 'package:learn_flutter/_2/state_manage.dart';
import 'package:learn_flutter/_2/widget.dart';
import 'package:learn_flutter/_3/button.dart';
import 'package:learn_flutter/_3/image_and_icon.dart';
import 'package:learn_flutter/_3/input_and_form.dart';
import 'package:learn_flutter/_3/progress_indicator.dart';
import 'package:learn_flutter/_3/switch_and_checkbox.dart';
import 'package:learn_flutter/_3/text.dart';
import 'package:learn_flutter/_4/align.dart';
import 'package:learn_flutter/_4/constraints.dart';
import 'package:learn_flutter/_4/flex.dart';
import 'package:learn_flutter/_4/flow.dart';
import 'package:learn_flutter/_4/row_and_column.dart';
import 'package:learn_flutter/_4/sstack_and_positioned.dart';

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
    'progress': (context) => const ProgressIndicatorPage(),
    'constraints': (context) => const ConstraintsPage(),
    'row_and_column': (context) => const RowAndColumnPage(),
    'flex': (context) => const FlexPage(),
    'flow': (context) => const FlowPage(),
    'stack': (context) => const StackAndPositionedPage(),
    'align': (context) => const AlignPage(),
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
