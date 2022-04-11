import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, left: 120),
            constraints: const BoxConstraints.tightFor(width: 200, height: 150),
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4)
                ]),
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(.2),
            child: const Text(
              'Hello wrold',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          )
        ],
      ),
    );
  }
}
