import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween(begin: 50.0, end: 150.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });

    animation2 = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation2 = Tween(begin: 50.0, end: 150.0).animate(animation2);
    // ..addListener(() {
    //   setState(() {});
    // });

    animation3 = Tween(begin: 100.0, end: 300.0).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: animation.value,
                height: animation.value,
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Center(
                  child: Text(
                    'Animation',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(16)),
            AnimationContainer(
              animation: animation2,
            ),
            const Padding(padding: EdgeInsets.all(16)),
            AnimatedBuilder(
                animation: animation2,
                child: const Text('AnimatedBuilder',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                builder: (ctx, child) {
                  return Center(
                    child: Container(
                      width: animation2.value,
                      height: animation2.value,
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Center(
                        child: child,
                      ),
                    ),
                  );
                }),
            const Padding(padding: EdgeInsets.all(16)),
            Center(
              child: Container(
                width: animation3.value,
                height: 20,
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Center(
                  child: Text(
                    'AnimationStatus',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
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
        child: const Center(
          child: Text(
            'AnimatedWidget',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  const AnimationContainer({Key? key, required Animation animation})
      : super(key: key, listenable: animation);
}
