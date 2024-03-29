import 'package:flutter/material.dart';

class InputAndFormPage extends StatefulWidget {
  const InputAndFormPage({Key? key}) : super(key: key);

  @override
  State<InputAndFormPage> createState() => _InputAndFormPageState();
}

class _InputAndFormPageState extends State<InputAndFormPage> {
  final TextEditingController _usernameController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  final _formUsernameController = TextEditingController();
  final _formPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'hello world';
    _usernameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _usernameController.text.length);
    _usernameController.addListener(() {
      print('addListener:${_usernameController.text}');
    });
    focusNode1.addListener(() {
      print('input1 has focus?${focusNode1.hasFocus}');
    });
    focusNode2.addListener(() {
      print('input2 has focus?${focusNode2.hasFocus}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InputAndForm'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [getInput(), getForm()],
          ),
        ));
  }

  Widget getInput() {
    return Column(
      children: [
        TextField(
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
        ),
        TextField(
          autofocus: true,
          focusNode: focusNode1,
          decoration: const InputDecoration(labelText: 'input1'),
        ),
        TextField(
          focusNode: focusNode2,
          decoration: const InputDecoration(labelText: 'input2'),
        ),
        Builder(
            builder: (context) => Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          focusScopeNode ??= FocusScope.of(context);
                          focusScopeNode?.requestFocus(focusNode2);
                        },
                        child: const Text('move focus to input2')),
                    ElevatedButton(
                        onPressed: () {
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                        },
                        child: const Text('hide keyboard'))
                  ],
                )),
        const TextField(
          decoration: InputDecoration(
              labelText: 'custom',
              prefixIcon: Icon(Icons.person),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
        ),
        Theme(
            data: Theme.of(context).copyWith(
                hintColor: Colors.green,
                inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14))),
            child: Column(
              children: const [
                TextField(
                  decoration: InputDecoration(
                      labelText: 'username',
                      hintText: 'input username',
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'password',
                      hintText: 'input password',
                      prefixIcon: Icon(Icons.lock),
                      hintStyle: TextStyle(color: Colors.green, fontSize: 10)),
                ),
              ],
            )),
        Container(
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'email',
                hintText: 'input email',
                prefixIcon: Icon(Icons.email),
                border: InputBorder.none),
          ),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
        )
      ],
    );
  }

  Widget getForm() {
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: _formUsernameController,
              decoration: const InputDecoration(
                  labelText: 'username',
                  hintText: 'input username',
                  prefixIcon: Icon(Icons.person)),
              validator: (value) {
                return value!.trim().isNotEmpty ? null : "username can't none";
              },
            ),
            TextFormField(
              controller: _formPasswordController,
              decoration: const InputDecoration(
                  labelText: 'password',
                  hintText: 'input password',
                  prefixIcon: Icon(Icons.lock)),
              validator: (value) {
                return value!.trim().length > 5
                    ? null
                    : "password length can't less than 6";
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Login'),
                    ),
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        print('Login Success');
                      } else {
                        print('Login Error');
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 28, left: 32),
                    child: Builder(
                      builder: (context) {
                        return ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Login'),
                          ),
                          onPressed: () {
                            if (Form.of(context)!.validate()) {
                              print('Login Success');
                            } else {
                              print('Login Error');
                            }
                          },
                        );
                      },
                    ))
              ],
            )
          ],
        ));
  }
}
