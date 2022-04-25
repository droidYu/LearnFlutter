
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_libraries/flutter_redux/actions.dart';


class ReduxPage extends StatelessWidget {
  const ReduxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Learn flutter_redux'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StoreConnector<int, int>(
                converter: (store) => store.state,
                builder: (context, count) {
                  return Text(
                    count.toString(),
                    style: const TextStyle(fontSize: 48),
                  );
                },
              ),
              StoreConnector<int, VoidCallback>(
                converter: (store) => () => store.dispatch(MyActions.Add),
                builder: (context, callback) {
                  return ElevatedButton(
                      onPressed: callback, child: const Text('Add'));
                },
              ),
              StoreConnector<int, VoidCallback>(
                  builder: (context, callback) => ElevatedButton(
                      onPressed: callback, child: const Text('Minus')),
                  converter: (store) =>
                      () => store.dispatch(MyActions.Minus))
            ],
          ),
        ));
  }
}
