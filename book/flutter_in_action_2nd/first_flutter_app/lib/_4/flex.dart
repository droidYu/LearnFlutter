import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flex'),
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    color: Colors.green,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 200,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.red,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
