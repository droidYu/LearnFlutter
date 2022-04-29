import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/_10/custom_widget.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

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
