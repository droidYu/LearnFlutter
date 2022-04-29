import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/_10/custom_widget.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Widger'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GradientButton(
            child: const Text('Hello'),
            colors: const [Colors.orange, Colors.red],
            height: 50,
            onPressed: onTap,
          ),
          GradientButton(
            child: const Text('Hello'),
            colors: [Colors.lightGreen, Colors.green.shade700],
            height: 50,
            onPressed: onTap,
          ),
          GradientButton(
            child: const Text('Hello'),
            colors: [Colors.lightBlue.shade300, Colors.blueAccent],
            height: 50,
            onPressed: onTap,
          ),
          TurnBox(
            child: const Icon(
              Icons.refresh,
              size: 50,
            ),
            turns: turns,
            speed: 500,
          ),
          TurnBox(
            child: const Icon(
              Icons.refresh,
              size: 150,
            ),
            turns: turns,
            speed: 1000,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  turns += .2;
                });
              },
              child: const Text('顺时针旋转1/5圈')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  turns -= .2;
                });
              },
              child: const Text('逆时针旋转1/5圈'))
        ],
      ),
    );
  }

  onTap() {
    if (kDebugMode) {
      print('button click');
    }
  }
}
