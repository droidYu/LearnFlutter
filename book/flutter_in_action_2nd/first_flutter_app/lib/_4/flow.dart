import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget {
  const FlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flow'),
        ),
        body: Column(
          children: [
            Row(
              children: [Text('xx' * 100)],
            ),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: const [
                Chip(
                  label: Text('Hello'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Hello'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Hello'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Hello'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Hello'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
                Chip(
                  label: Text('Hello'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('A'),
                  ),
                ),
              ],
            ),
            Flow(
              delegate: TestFlowDelegate(margin: const EdgeInsets.all(10)),
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.yellow,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.brown,
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.purple,
                ),
              ],
            )
          ],
        ));
  }
}

class TestFlowDelegate extends FlowDelegate {
  late EdgeInsets margin;

  TestFlowDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return const Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
