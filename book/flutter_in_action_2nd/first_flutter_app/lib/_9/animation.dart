import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween(begin: 100.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        body: AnimationContainer(
          animation: animation,
        ));
  }
}

class AnimationContainer extends AnimatedWidget {
  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
      child: Container(
        width: animation.value,
        height: animation.value,
        decoration: const BoxDecoration(color: Colors.blue),
      ),
    );
  }

  const AnimationContainer({Key? key, required Animation animation})
      : super(key: key, listenable: animation);
}
