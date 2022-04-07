import 'package:flutter/material.dart';

class ImageAndIconPage extends StatelessWidget {
  const ImageAndIconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var img = const AssetImage('assets/images/avatar.png');

    return Scaffold(
        appBar: AppBar(
          title: const Text('ImageAndIcon'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/avatar.png'),
                  width: 100,
                ),
                Image.asset(
                  'assets/images/avatar.png',
                  width: 100,
                ),
                const Image(
                  image: NetworkImage(
                      'https://p3-passport.byteacctimg.com/img/user-avatar/a6962cd6ddacf71dc04659141833934c~300x300.image'),
                  width: 100,
                ),
                Image.network(
                  'https://p3-passport.byteacctimg.com/img/user-avatar/a6962cd6ddacf71dc04659141833934c~300x300.image',
                  width: 100,
                ),
                Column(
                  children: [
                    Image(
                      image: img,
                      height: 50,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    Image(
                      image: img,
                      height: 50,
                      width: 50,
                      fit: BoxFit.contain,
                    ),
                    Image(
                      image: img,
                      height: 100,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Image(
                      image: img,
                      height: 100,
                      width: 50,
                      fit: BoxFit.fitWidth,
                    ),
                    Image(
                      image: img,
                      height: 100,
                      width: 50,
                      fit: BoxFit.fitHeight,
                    ),
                    Image(
                      image: img,
                      height: 100,
                      width: 50,
                      fit: BoxFit.scaleDown,
                    ),
                    Image(
                      image: img,
                      height: 50,
                      width: 100,
                      fit: BoxFit.none,
                    ),
                    Image(
                      image: img,
                      color: Colors.blue,
                      colorBlendMode: BlendMode.difference,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                    Image(
                      image: img,
                      width: 100,
                      height: 200,
                      repeat: ImageRepeat.repeatY,
                    ),
                  ].map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            width: 100,
                            child: e,
                          ),
                        ),
                        Text(e.fit.toString())
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ));
  }
}
