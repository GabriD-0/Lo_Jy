import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_application_1/login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    loadImage('assets/images/fita_cassete.png').then((img) {
      setState(() {
        image = img;
      });
    });
  }

  Future<ui.Image> loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  Widget buildFormFields(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Digite seu nome:',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Digite seu e-mail:',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Digite sua senha:',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: image != null
                        ? CustomPaint(
                            size: Size(365, 600),
                            painter: MyCustomPainter(image!),
                          )
                        : CircularProgressIndicator(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                        ),
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Color.fromARGB(255, 231, 130, 163),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 231, 130, 163),
                          minimumSize: Size(300, 50),
                        ),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: buildFormFields(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final ui.Image image;

  MyCustomPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 247, 175, 81),
        Color.fromARGB(147, 233, 30, 98),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    double aspectRatio = image.width / image.height;
    double imgWidth = size.width * 0.25;
    double imgHeight = imgWidth / aspectRatio;
    Offset imgPosition =
        Offset((size.width - imgWidth) / 2, (size.height - imgHeight) * 0.3);

    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(imgPosition.dx, imgPosition.dy, imgWidth, imgHeight),
      Paint(),
    );

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: "Lo-Jy",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    Offset textPosition = Offset(
      (size.width - textPainter.width) / 2,
      imgPosition.dy - textPainter.height - 70,
    );
    textPainter.paint(canvas, textPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is MyCustomPainter && oldDelegate.image != image;
  }
}
