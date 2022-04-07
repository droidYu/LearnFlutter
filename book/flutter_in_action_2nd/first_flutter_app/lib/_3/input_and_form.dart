import 'package:flutter/material.dart';

class InputAndFormPage extends StatefulWidget {
  const InputAndFormPage({Key? key}) : super(key: key);

  @override
  State<InputAndFormPage> createState() => _InputAndFormPageState();
}

class _InputAndFormPageState extends State<InputAndFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputAndForm'),
      ),
      body: Column(
        children: const [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: 'username',
                hintText: 'input username',
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'password',
                hintText: 'input password',
                prefixIcon: Icon(Icons.lock)),
            obscureText: true,
          )
        ],
      ),
    );
  }
}
