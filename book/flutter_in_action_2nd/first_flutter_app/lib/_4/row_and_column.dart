import 'package:flutter/material.dart';

class RowAndColumnPage extends StatelessWidget {
  const RowAndColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RowAndColumn'),
        ),
        body: Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("hello world "),
                      Text("I am Jack "),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
