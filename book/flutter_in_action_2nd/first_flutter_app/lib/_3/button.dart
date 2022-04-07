import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Button'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text('ElevatedButton')),
              TextButton(onPressed: () {}, child: const Text('TextButton')),
              OutlineButton(
                onPressed: () {},
                child: const Text('OutlineButton'),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("发送"),
                onPressed: () {},
              ),
              OutlineButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: const Icon(Icons.info),
                label: const Text("详情"),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
