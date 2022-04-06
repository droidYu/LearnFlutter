import 'package:flutter/material.dart';

class ContextPage extends StatelessWidget {
  const ContextPage({Key? key}) : super(key: key);

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
