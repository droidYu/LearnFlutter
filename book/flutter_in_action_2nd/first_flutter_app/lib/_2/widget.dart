import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Echo extends StatelessWidget {
  const Echo({Key? key, required this.text, this.backgroundColor = Colors.grey})
      : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class StatelessWidgetRoute extends StatelessWidget {
  const StatelessWidgetRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StatelessWidget"),),
      body: const Echo(text: 'Hello world',),
    );
  }
}

class ContextRoute extends StatelessWidget {
  const ContextRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context测试'),
      ),
      body: Builder(
        builder: (context) {
          Scaffold? scaffold =
          context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold?.appBar as AppBar).title!;
        },
      ),
    );
  }
}

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({Key? key}) : super(key: key);

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  static final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Text('子树获取State对象'),
      ),
      body: Center(
        child: Column(
          children: [
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    ScaffoldState? state =
                    context.findAncestorStateOfType<ScaffoldState>();
                    state?.openDrawer();
                  },
                  child: const Text('打开抽屉菜单1'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    ScaffoldState state = Scaffold.of(context);
                    state.openDrawer();
                  },
                  child: const Text('打开抽屉菜单2'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('我是SnackBar')));
                  },
                  child: const Text('显示SnackBar'));
            }),
            Builder(builder: (context) {
              return ElevatedButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  child: const Text('打开抽屉菜单3'));
            })
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}

class CupertinoTestRoute extends StatelessWidget {
  const CupertinoTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Cupertino Demo'),
        ),
        child: Center(
          child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: const Text('Press'),
            onPressed: () {},
          ),
        ));
  }
}

