import 'package:flutter/material.dart';
import 'package:flutter_application_1/practices_screen.dart';
import 'package:flutter_application_1/profile_screen.dart';
import 'package:flutter_application_1/timer_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Define HomeScreen como tela principal
      routes: {
        '/home': (context) => HomeScreen(),
        '/practices': (context) => PracticesScreen(),
        //'/videos': (context) => VideosScreen(),
        '/timer': (context) => TimerScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Índice do item selecionado no BottomNavigationBar

  void _navigateToScreen(int index) {
    setState(() {
      _currentIndex = index; // Atualiza o índice do BottomNavigationBar
    });

    String routeName;
    switch (index) {
      case 0:
        routeName = '/practices'; // Para a tela de práticas
        break;
      case 1:
        routeName = '/videos'; // Para a tela de vídeos
        break;
      case 2:
        routeName = '/timer'; // Para a tela de timer
        break;
      case 3:
        routeName = '/profile'; // Para a tela de perfil
        break;
      default:
        routeName = '/home'; // Se necessário, uma rota padrão
    }

    Navigator.of(context)
        .pushReplacementNamed(routeName); // Navegação usando rotas nomeadas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabeçalho com gradiente e citação
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 247, 175, 81), // Laranja
                  Color.fromARGB(147, 233, 30, 98), // Rosa
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, color: Colors.white),
                    Text(
                      'NOVIDADES',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(width: 24), // Espaço para equilibrar
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  '“O apego é exatamente o oposto do amor. '
                  'O amor diz: quero que sejas feliz. '
                  'O apego diz: quero que me faças feliz.”',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center, // Adicionando ponto-e-vírgula
                ),
                Text(
                  'JETSUNMA TENZIN PALMO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center, // Adicionando ponto-e-vírgula
                ),
              ],
            ),
          ),
          // Imagem da montanha
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              'assets/images/montanha.png', // Substitua pelo caminho da imagem
              fit: BoxFit.cover,
              width:
                  double.infinity, // Corrigindo para adicionar ponto-e-vírgula
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'QUER PRATICAR MAIS?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Assine o Lo-Jy e receba muito mais conteúdo.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Spacer(), // Para espaço flexível
          // BottomNavigationBar com navegação
          BottomNavigationBar(
            currentIndex: _currentIndex, // Ítem atualmente selecionado
            onTap: (index) =>
                _navigateToScreen(index), // Navega para a tela correspondente
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Práticas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library),
                label: 'Vídeos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.timer),
                label: 'Timer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
            selectedItemColor: Color.fromARGB(147, 233, 30, 98), // Rosa
            unselectedItemColor: Colors.grey, // Cor para itens não selecionados
            backgroundColor:
                Colors.white, // Cor do fundo do BottomNavigationBar
          ),
        ],
      ),
    );
  }
}
