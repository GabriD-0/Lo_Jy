import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Duration duration = Duration(minutes: 10); // Duração inicial
  int interval = 3; // Intervalo inicial
  String bellType = 'Sakia'; // Tipo de sino inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Timer',
          style: TextStyle(
            color: Colors.white, // Texto branco
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Seta de retorno branca
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Rota para a tela desejada
            Navigator.pushNamed(context, '/home'); // Retorna para a HomeScreen
          },
        ),
        flexibleSpace: Container(
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
        ),
      ),
      body: Column(
        children: [
          // Controles para o tipo de sino, duração e intervalo
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.grey),
                  title: Text('Tipo de Sino'),
                  subtitle: Text(bellType),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Lógica para alterar o tipo de sino
                  },
                ),
                ListTile(
                  leading: Icon(Icons.access_time, color: Colors.grey),
                  title: Text('Duração'),
                  subtitle: Text('${duration.inMinutes} minutos'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Lógica para alterar a duração
                  },
                ),
                ListTile(
                  leading: Icon(Icons.graphic_eq, color: Colors.grey),
                  title: Text('Intervalo'),
                  subtitle: Text('${interval} segundos'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    // Lógica para alterar o intervalo
                  },
                ),
              ],
            ),
          ),
          Spacer(flex: 3), // Para subir o botão "Iniciar"
          ElevatedButton(
            onPressed: () {
              // Lógica para iniciar o temporizador
            },
            child: Text(
              'INICIAR',
              style: TextStyle(
                color: Colors.white, // Texto do botão em branco
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(147, 233, 30, 98), // Cor do botão
              padding: EdgeInsets.symmetric(
                  horizontal: 70, vertical: 20), // Aumentar tamanho do botão
            ),
          ),
          SizedBox(height: 150), // Ajustar espaço abaixo do botão
        ],
      ),
    );
  }
}
