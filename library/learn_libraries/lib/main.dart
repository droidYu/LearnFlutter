import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Add, Minus }

int myReducer(int state, dynamic action) {
  switch (action) {
    case Actions.Add:
      state += 1;
      break;
    case Actions.Minus:
      state -= 1;
      break;
  }
  return state;
}

void main() {
  final store = Store<int>(myReducer, initialState: 0);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);

  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
        store: store,
        child: MaterialApp(
          title: 'Learn flutter_redux',
          home: Scaffold(
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
                      converter: (store) => () => store.dispatch(Actions.Add),
                      builder: (context, callback) {
                        return ElevatedButton(
                            onPressed: callback, child: const Text('Add'));
                      },
                    ),
                    StoreConnector<int, VoidCallback>(
                        builder: (context, callback) => ElevatedButton(
                            onPressed: callback, child: const Text('Minus')),
                        converter: (store) =>
                            () => store.dispatch(Actions.Minus))
                  ],
                ),
              )),
        ));
  }
}
