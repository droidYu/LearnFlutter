import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstRoute'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return SecondRoute(
                    value: 'hello',
                  );
                }));
                if (kDebugMode) {
                  print('返回值：$result');
                }
              },
              child: const Text('To Second'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, 'new_page');
              },
              child: const Text('To NewRoute'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  SecondRoute({Key? key, required this.value}) : super(key: key);

  String value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondRoute'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is second and value is :$value'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "world");
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}


class NewRoute extends StatelessWidget {
  const NewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NewRoute'),),
      body: Center(
        child: Text('This is new route'),
      ),
    );
  }
}
