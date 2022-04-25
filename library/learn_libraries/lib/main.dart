import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_libraries/flutter_redux/flutter_redux.dart';
import 'package:learn_libraries/flutter_redux/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<int>(myReducer, initialState: 0);
  runApp(MyApp(store: store));
}
final routeName = [
  'flutter_redux',
];
class MyApp extends StatelessWidget {
   MyApp({Key? key, required this.store}) : super(key: key);

  final Store<int> store;



  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
        store: store,
        child: MaterialApp(
            title: 'Learn Flutter Libraries',
            routes: {routeName[0]: (_) => const ReduxPage()},
            home: const HomePage()));
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
                  Navigator.pushNamed(context, routeName[0]);
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
