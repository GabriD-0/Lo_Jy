import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_application_1/account_screen.dart';
import 'package:flutter_application_1/home.dart';

// Esta será a tela de login
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    final ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: image != null
                    ? CustomPaint(
                        size: Size(365, 600),
                        painter: MyCustomPainter(image!),
                      )
                    : CircularProgressIndicator(), // Mostra um indicador de progresso enquanto a imagem está carregando
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
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                    ),
                    child: Text(
                      'Criar Conta',
                      style:
                          TextStyle(color: Color.fromARGB(255, 231, 130, 163)),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 231, 130, 163),
                      minimumSize: Size(300, 50),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
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
    // Definindo o gradiente de laranja para rosa
    final Gradient gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 247, 175, 81), // Laranja
        Color.fromARGB(147, 233, 30, 98) // Rosa
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    // Restante do código para desenhar a imagem e o texto...
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

    // Configuração e desenho do texto mantidos como estavam
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
    // Verifica se a imagem mudou
    return oldDelegate is MyCustomPainter && oldDelegate.image != image;
  }
}
