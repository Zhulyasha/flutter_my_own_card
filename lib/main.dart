import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: MainBg(),
        ),
        // floatingActionButton: Flao,
      ),
    );
  }
}

class MainBg extends StatelessWidget {
  const MainBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const FittedBox(
          child: MediaQueryImage(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Image(
              width: 350,
              height: 83,
              fit: BoxFit.fill,
              image: AssetImage('image/bg_corner.png')),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Image(
              width: 55,
              height: 55,
              fit: BoxFit.fill,
              image: AssetImage('image/hand.png')),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 0, 0),
          child: Container(
            child: const Text(
              'MyCard',
              style: TextStyle(
                color: Color(0x63636303),
                fontSize: 36,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 137),
          child: Center(
            child: FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              front: MyPhoto(),
              back: QrPhoto(),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 400),
          child: Center(
            child: MyNumber(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 542),
          child: Center(child: MyEmail()),
        ),
      ],
    );
  }
}

class MyNumber extends StatelessWidget {
  const MyNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(fit: BoxFit.fill, image: AssetImage('image/bg_number_rect.png')),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
          child: Image(
            image: AssetImage('image/phone.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(100, 25, 0, 0),
          child: Text(
            '+380501999294',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 26,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

class MyEmail extends StatelessWidget {
  const MyEmail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(fit: BoxFit.fill, image: AssetImage('image/bg_email_rect.png')),
        Padding(
          padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
          child: Image(
            image: AssetImage('image/user.png'),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(55, 25, 0, 0),
          child: Text(
            'olga.zhul.1@icloud.com',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 26,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}

class QrPhoto extends StatelessWidget {
  const QrPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          const Image(
              fit: BoxFit.fill, image: AssetImage('image/bg_rect_grey.png')),
          QrImage(
            data:
                'https://www.linkedin.com/in/olga-zhulinskaya-a322a8224/      ',
            version: QrVersions.auto,
            size: 180.0,
            gapless: false,
          ),
        ],
      ),
    );
  }
}

class MyPhoto extends StatelessWidget {
  const MyPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage(
        'image/me_photo.png',
      ),
      width: 200,
    );
  }
}

class MediaQueryImage extends StatelessWidget {
  const MediaQueryImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      width: MediaQuery.of(context).size.width,
      image: const AssetImage('image/bg_rect_up.png'),
      fit: BoxFit.fitWidth,
    );
  }
}
