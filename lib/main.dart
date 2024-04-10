import 'package:flutter/material.dart';
import 'package:flutter_application_1/account_screen.dart';
import 'package:flutter_application_1/login_screen.dart';

// Função principal que inicia a execução do aplicativo Flutter.
void main() {
  runApp(MyApp());
}

// Declaração da classe MyApp, que é um StatelessWidget. StatelessWidget é uma base para widgets que não requerem estado dinâmico (mudanças na UI após o widget ser construído).
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retorna um MaterialApp, que serve como um container para a aplicação Flutter, configurando estilos e rotas de navegação, entre outros.
    return MaterialApp(
      title: 'lo-jy',
      debugShowCheckedModeBanner: false, // Remove a faixa de debug.
      theme: ThemeData(
        primarySwatch:
            Colors.blue, // Define a cor principal do tema do aplicativo.
      ),
      home: LoginScreen(), // Define o widget inicial, que é a tela de login.
      routes: {
        // Define as rotas.
        '/signup': (context) => SignupScreen(), // Rota para a tela de cadastro.
        '/login': (context) =>
            LoginScreen(), // Rota para a tela de login, novamente acessível.
      },
    );
  }
}
