import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  void _tapRecognizer() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello world',
            textAlign: TextAlign.left,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            'Hello world',
            textScaleFactor: 1.5,
          ),
          Text(
            "Hello world " * 6, //字符串重复六次
            textAlign: TextAlign.center,
          ),
          Text(
            'Hello world',
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
                height: 1.2,
                fontFamily: 'Courier',
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          const Text.rich(TextSpan(children: [
            TextSpan(text: 'Home: '),
            TextSpan(
              text: 'https://droidyu.github.io',
              style: TextStyle(color: Colors.blue),
            )
          ])),
          DefaultTextStyle(
              style: const TextStyle(color: Colors.red, fontSize: 20),
              textAlign: TextAlign.start,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('hello world'),
                  Text('hello world'),
                  Text(
                    'hello world',
                    style: TextStyle(inherit: false, color: Colors.grey),
                  ),
                ],
              )),
          const Text(
            'Use the font for this text',
            style: TextStyle(fontFamily: 'GrapeNuts'),
          )
        ],
      ),
    );
  }
}
