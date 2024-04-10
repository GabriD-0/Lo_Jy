import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_application_1/account_screen.dart';

// Define a tela de login como um StatefulWidget para gerenciar seu estado dinamicamente.
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Estado do LoginScreen, que cuida do carregamento e exibição de uma imagem.
class _LoginScreenState extends State<LoginScreen> {
  ui.Image? image; // Variável para armazenar a imagem carregada.

  @override
  void initState() {
    super.initState();
    // Carrega a imagem de forma assíncrona e atualiza o estado do widget quando concluído.
    loadImage('assets/images/fita_cassete.png').then((img) {
      setState(() {
        image = img;
      });
    });
  }

  // Método para carregar uma imagem dos recursos do aplicativo.
  Future<ui.Image> loadImage(String path) async {
    final ByteData data =
        await rootBundle.load(path); // Carrega os dados da imagem.
    final Uint8List bytes = data.buffer.asUint8List(); // Converte para bytes.
    final ui.Codec codec =
        await ui.instantiateImageCodec(bytes); // Cria um codec de imagem.
    final ui.FrameInfo fi =
        await codec.getNextFrame(); // Obtém o primeiro quadro da imagem.
    return fi.image; // Retorna a imagem.
  }

  @override
  Widget build(BuildContext context) {
    // Constrói a interface do usuário da tela de login.
    return MaterialApp(
      // Criação do scaffold, que fornece a estrutura visual básica.
      home: Scaffold(
        backgroundColor: Colors.white, // Define a cor de fundo.
        body: Column(
          // Organiza os elementos verticalmente.
          children: [
            Expanded(
              child: Center(
                // Centraliza o conteúdo.
                child: image != null
                    ? CustomPaint(
                        // Desenha a imagem com um CustomPainter se carregada.
                        size: Size(365, 600),
                        painter: MyCustomPainter(image!),
                      )
                    : CircularProgressIndicator(), // Mostra um indicador de progresso enquanto carrega.
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                  20.0), // Adiciona um espaço ao redor dos botões.
              child: Column(
                // Organiza os botões verticalmente.
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Botão para navegar para a tela de cadastro.
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                SignupScreen()), // Rota para a tela de cadastro.
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
                  SizedBox(height: 10), // Espaço entre os botões.
                  // Botão para ação de login.
                  ElevatedButton(
                    onPressed: () {},
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

// CustomPainter utilizado para desenhar a imagem carregada na tela.
class MyCustomPainter extends CustomPainter {
  final ui.Image image; // Imagem a ser pintada.

  MyCustomPainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    // Definição do gradiente de cor como fundo.
    final Gradient gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 247, 175, 81),
        Color.fromARGB(147, 233, 30, 98)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Desenha o retângulo de fundo com o gradiente.
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    var paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);

    // Cálculos para posicionar e escalar a imagem carregada corretamente.
    double aspectRatio = image.width / image.height;
    double imgWidth = size.width * 0.25;
    double imgHeight = imgWidth / aspectRatio;
    Offset imgPosition =
        Offset((size.width - imgWidth) / 2, (size.height - imgHeight) * 0.3);

    // Desenha a imagem na tela.
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      Rect.fromLTWH(imgPosition.dx, imgPosition.dy, imgWidth, imgHeight),
      Paint(),
    );

    // Desenho do texto na tela.
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: "Lo-Jy",
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    Offset textPosition = Offset((size.width - textPainter.width) / 2,
        imgPosition.dy - textPainter.height - 70);
    textPainter.paint(canvas, textPosition);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Define quando o CustomPainter deve redesenhar, aqui é quando a imagem é atualizada.
    return oldDelegate is MyCustomPainter && oldDelegate.image != image;
  }
}
