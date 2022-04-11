import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  const DecoratedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DecoratedBox'),
        ),
        body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange.shade700]),
                borderRadius: BorderRadius.circular(3),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4)
                ]),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
