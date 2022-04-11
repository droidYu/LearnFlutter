import 'dart:math';

import 'package:flutter/material.dart';

class TransformPage extends StatelessWidget {
  const TransformPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transform'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 32),
            child: Container(
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(.5),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.deepOrange,
                  child: const Text('Apartment for rent!'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.translate(
                offset: const Offset(-20, -5),
                child: const Text('translate'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                angle: pi / 2,
                child: const Text('rotate'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: const Text('scale'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                    scale: 1.5,
                    child: const Text('Hello world'),
                  ),
                ),
                const Text(
                  '你好',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text('Hello world'),
                  ),
                ),
                Text(
                  '你好',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
