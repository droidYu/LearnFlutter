import 'package:flutter/material.dart';

class InputAndFormPage extends StatefulWidget {
  const InputAndFormPage({Key? key}) : super(key: key);

  @override
  State<InputAndFormPage> createState() => _InputAndFormPageState();
}

class _InputAndFormPageState extends State<InputAndFormPage> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'hello world';
    _usernameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _usernameController.text.length);
    _usernameController.addListener(() {
      print('addListener:${_usernameController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputAndForm'),
      ),
      body: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _usernameController,
            onChanged: (value) {
              print('onChanged:$value');
            },
            decoration: const InputDecoration(
                labelText: 'username',
                hintText: 'input username',
                prefixIcon: Icon(Icons.person)),
          ),
          const TextField(
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
