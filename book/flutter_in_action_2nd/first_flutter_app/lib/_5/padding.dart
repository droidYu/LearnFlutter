import 'package:flutter/material.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Padding'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Hello world'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Hello world'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text('Hello world'),
            )
          ],
        ),
      ),
    );
  }
}
