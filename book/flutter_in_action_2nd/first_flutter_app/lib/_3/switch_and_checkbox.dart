import 'package:flutter/material.dart';

class SwitchAndCheckboxPage extends StatefulWidget {
  const SwitchAndCheckboxPage({Key? key}) : super(key: key);

  @override
  State<SwitchAndCheckboxPage> createState() => _SwitchAndCheckboxPageState();
}

class _SwitchAndCheckboxPageState extends State<SwitchAndCheckboxPage> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SwitchAndCheckbox'),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(
                value: _switchSelected,
                onChanged: (value) {
                  setState(() {
                    _switchSelected = value;
                  });
                }),
            Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                })
          ],
        ),
      ),
    );
  }
}
