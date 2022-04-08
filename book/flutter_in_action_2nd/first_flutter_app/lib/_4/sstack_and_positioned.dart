import 'package:flutter/material.dart';

class StackAndPositionedPage extends StatelessWidget {
  const StackAndPositionedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StackAndPositioned'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            const Positioned(left: 18, child: Text('Hello')),
            Container(
              child: const Text(
                'Hello world',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            const Positioned(
              child: Text('Haha'),
              top: 18,
            )
          ],
        ),
      ),
    );
  }
}
