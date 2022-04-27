import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            InkWell(
              child: Hero(
                  tag: 'avatar',
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/avatar.png',
                      width: 100,
                    ),
                  )),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: const HeroRoute(),
                  );
                }));
              },
            ),
            const Padding(padding: EdgeInsets.only(top: 400)),
            Container(
              width: 300,
              height: 50,
              decoration: const BoxDecoration(color: Colors.blue),
              child: const Center(
                child: Text(
                  'Click avatar',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeroRoute extends StatelessWidget {
  const HeroRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero'),
      ),
      body: Center(
        child: Hero(
          tag: 'avatar',
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}
