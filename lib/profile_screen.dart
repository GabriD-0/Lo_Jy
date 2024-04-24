import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(
            color: Colors.white, // Texto branco
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Ícones do AppBar brancos
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Jessica Welch',
                style: TextStyle(color: Colors.white), // Texto branco
              ),
              accountEmail: Text(
                'jessica@email.com',
                style: TextStyle(color: Colors.white), // Texto branco
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'JW',
                  style: TextStyle(
                    color: Color.fromARGB(255, 247, 175, 81), // Cor do texto
                  ),
                ),
              ),
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
            ListTile(
              leading: Icon(Icons.info, color: Colors.grey),
              title: Text('Sobre'),
              onTap: () {
                // Lógica para "Sobre"
              },
            ),
            ListTile(
              leading: Icon(Icons.lock, color: Colors.grey),
              title: Text('Assinar'),
              onTap: () {
                // Lógica para "Assinar"
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.grey),
              title: Text('Conta'),
              onTap: () {
                // Lógica para "Conta"
              },
            ),
            ListTile(
              leading: Icon(Icons.play_circle_fill, color: Colors.grey),
              title: Text('Introdução'),
              onTap: () {
                // Lógica para "Introdução"
              },
            ),
            ListTile(
              leading: Icon(Icons.alarm, color: Colors.grey),
              title: Text('Lembretes'),
              onTap: () {
                // Lógica para "Lembretes"
              },
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.grey),
              title: Text('Ajuda'),
              onTap: () {
                // Lógica para "Ajuda"
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.grey),
              title: Text('Sair'),
              onTap: () {
                Navigator.pushNamed(
                    context, '/login'); // Rota para a tela de login
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza no eixo vertical
          children: [
            Text(
              'Bem-vindo ao Perfil!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Espaço entre o texto e o botão
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, '/home'); // Voltar para a HomeScreen
              },
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Colors.white, // Texto branco
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(147, 233, 30, 98), // Cor do botão
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Aumentar tamanho do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
