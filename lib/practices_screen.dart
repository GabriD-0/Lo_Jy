import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class PracticesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Práticas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Seta branca
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ); // Retorna para a tela anterior
          },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 247, 175, 81), // Laranja
                Color.fromARGB(147, 233, 30, 98), // Rosa
              ],
              begin: Alignment
                  .topCenter, // Gradiente começando no canto superior esquerdo
              end: Alignment
                  .bottomCenter, // Gradiente indo para o canto inferior direito
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Ícones do AppBar em branco
        ),
        toolbarTextStyle: TextTheme(
          headline6: TextStyle(
            color: Colors.white, // Texto branco
            fontSize: 20, // Tamanho do texto do AppBar
          ),
        ).bodyText2,
        titleTextStyle: TextTheme(
          headline6: TextStyle(
            color: Colors.white, // Texto branco
            fontSize: 20, // Tamanho do texto do AppBar
          ),
        ).headline6,
      ),
      body: Column(
        children: [
          // Menu de navegação entre as categorias
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 16), // Aumentado para maior área dos botões
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para a categoria "Programa CEB"
                  },
                  child: Text('PROGRAMA CEB'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Cor do botão
                    foregroundColor:
                        Color.fromARGB(147, 233, 30, 98), // Cor do texto
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para a categoria "Outras Práticas"
                  },
                  child: Text('OUTRAS PRÁTICAS'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(147, 233, 30, 98),
                    foregroundColor: Colors.white,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ],
            ),
          ),
          // Lista de categorias
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                ListTile(
                  leading: Icon(Icons.star,
                      color: Color.fromARGB(
                          255, 247, 175, 81)), // Laranja // Cor do ícone
                  title: Text(
                    'Equilíbrio Conativo',
                    style: TextStyle(fontSize: 20), // Aumentar tamanho do texto
                  ),
                  subtitle: Text('7 sessões'),
                  trailing: Icon(Icons.chevron_right),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    // Lógica para abrir detalhes da prática
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_pin,
                      color: Color.fromARGB(147, 233, 30, 98)),
                  title: Text(
                    'Equilíbrio da Atenção',
                    style: TextStyle(fontSize: 20), // Aumentar tamanho do texto
                  ),
                  subtitle: Text('6 sessões'),
                  trailing: Icon(Icons.chevron_right),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    // Lógica para abrir detalhes da prática
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lightbulb_outline,
                      color: Color.fromARGB(255, 247, 175, 81)), // Laranja
                  title: Text(
                    'Equilíbrio Cognitivo',
                    style: TextStyle(fontSize: 20), // Aumentar tamanho do texto
                  ),
                  subtitle: Text('5 sessões'),
                  trailing: Icon(Icons.chevron_right),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    // Lógica para abrir detalhes da prática
                  },
                ),
                ListTile(
                  leading: Icon(Icons.self_improvement,
                      color: Color.fromARGB(147, 233, 30, 98)),
                  title: Text(
                    'Equilíbrio Emocional',
                    style: TextStyle(fontSize: 20), // Aumentar tamanho do texto
                  ),
                  subtitle: Text('4 sessões'),
                  trailing: Icon(Icons.chevron_right),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    // Lógica para abrir detalhes da prática
                  },
                ),
                ListTile(
                  leading: Icon(Icons.fitness_center,
                      color: Color.fromARGB(255, 247, 175,
                          81)), // Laranja // Ícone para equilíbrio corporal
                  title: Text(
                    'Equilíbrio Corporal',
                    style: TextStyle(fontSize: 20), // Aumentar tamanho do texto
                  ),
                  subtitle: Text('3 sessões'),
                  trailing: Icon(Icons.chevron_right),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    // Lógica para abrir detalhes da prática
                  },
                ),
                ListTile(
                  leading: Icon(Icons.mood,
                      color: Color.fromARGB(147, 233, 30,
                          98)), // Ícone para equilíbrio espiritual
                  title: Text(
                    'Equilíbrio Espiritual',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text('2 sessões'),
                  trailing: Icon(Icons.chevron_right),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  onTap: () {
                    // Lógica para abrir detalhes da prática
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
