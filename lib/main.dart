import 'package:flutter/material.dart';
import 'package:flutter_application_1/account_screen.dart'; // Se necessário
import 'package:flutter_application_1/practices_screen.dart';
import 'package:flutter_application_1/timer_screen.dart';
import 'package:flutter_application_1/profile_screen.dart';
import 'package:flutter_application_1/videos_screen.dart'; // Se necessário
import 'package:flutter_application_1/home.dart'; // Se necessário
import 'package:flutter_application_1/login_screen.dart'; // Se necessário

// Função principal que inicia a execução do aplicativo Flutter.
void main() {
  runApp(MyApp());
}

// MyApp é um StatelessWidget que cria a estrutura básica do aplicativo.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          LoginScreen(), // Pode ser alterado para HomeScreen conforme necessário.
      routes: {
        // Definindo rotas para navegação no aplicativo.
        '/home': (context) => HomeScreen(), // Tela principal ou Home.
        '/practices': (context) => PracticesScreen(),
        //'/videos': (context) => VideosScreen(),
        '/timer': (context) => TimerScreen(),
        '/profile': (context) => ProfileScreen(),
        '/signup': (context) => SignupScreen(), // Se necessário para registro.
        '/login': (context) => LoginScreen(), // Para tela de login.
      },
    );
  }
}
