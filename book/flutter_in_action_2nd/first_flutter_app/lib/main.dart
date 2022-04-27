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
import 'package:learn_flutter/_5/container.dart';
import 'package:learn_flutter/_5/decorated_box.dart';
import 'package:learn_flutter/_5/padding.dart';
import 'package:learn_flutter/_5/transform.dart';
import 'package:learn_flutter/_9/animation.dart';
import 'package:learn_flutter/_9/hero.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final routes = {
    'hero_animation': (context) => const HeroAnimationPage(),
    'animation': (context) => const AnimationPage(),
    'container': (context) => const ContainerPage(),
    'transform': (context) => const TransformPage(),
    'decorated_box': (context) => const DecoratedBoxPage(),
    'padding': (context) => const PaddingPage(),
    'align': (context) => const AlignPage(),
    'stack': (context) => const StackAndPositionedPage(),
    'flow': (context) => const FlowPage(),
    'flex': (context) => const FlexPage(),
    'row_and_column': (context) => const RowAndColumnPage(),
    'constraints': (context) => const ConstraintsPage(),
    'progress': (context) => const ProgressIndicatorPage(),
    'input': (context) => const InputAndFormPage(),
    'switch': (context) => const SwitchAndCheckboxPage(),
    'image': (context) => const ImageAndIconPage(),
    'button': (context) => const ButtonPage(),
    'text': (context) => const TextPage(),
    'route': (context) => const FirstRoute(),
    'state_manage': (context) => const StateManageRoute(),
    'cupertino': (context) => const CupertinoTestRoute(),
    'state': (context) => const GetStateObjectRoute(),
    'context': (context) => const ContextRoute(),
    'widget': (context) => const StatelessWidgetRoute(),
    'new_page': (context) => const NewRoute(),
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
