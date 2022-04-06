import 'package:flutter/material.dart';

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
