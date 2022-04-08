import 'package:flutter/material.dart';

class ConstraintsPage extends StatelessWidget {
  const ConstraintsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constraints'),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 50),
            child: const SizedBox(
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }
}
