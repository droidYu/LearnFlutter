import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_libraries/flutter_redux/flutter_redux.dart';
import 'package:learn_libraries/flutter_redux/reducer.dart';
import 'package:redux/redux.dart';

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
        child: const MaterialApp(
            title: 'Learn Flutter Libraries', home: HomePage()));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Learn Flutter Libraries'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReduxPage()));
                },
                child: StoreConnector<int, int>(
                  converter: (store) => store.state,
                  builder: (context, count) {
                    return Text(
                      'flutter_redux  value:${count.toString()}',
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
