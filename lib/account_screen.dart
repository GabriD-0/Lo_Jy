import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';

// Definição de SignupScreen como um StatelessWidget, indicando que este widget não mantém estado.
class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Criação do scaffold, que fornece a estrutura visual básica.
    return Scaffold(
      backgroundColor: Colors.white, // Define a cor de fundo da tela.
      body: SingleChildScrollView(
        // Permite rolagem quando o conteúdo excede a tela.
        child: Column(
          // Organiza os elementos verticalmente.
          children: [
            SizedBox(height: 60), // Espaço vertical para separação.
            Center(
              // Centraliza o texto na tela.
              child: Text(
                'Cadastro', // Título da tela.
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 231, 130, 163), // Estilo do texto.
                ),
              ),
            ),
            SizedBox(height: 40), // Espaço vertical para separação.
            Padding(
              // Adiciona preenchimento em torno dos campos de formulário.
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // Organiza os campos de formulário verticalmente.
                children: [
                  TextField(
                    // Campo para inserção do nome.
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(), // Bordas ao redor do campo.
                    ),
                  ),
                  SizedBox(height: 15), // Espaço vertical entre os campos.
                  TextField(
                    // Campo para inserção do email.
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15), // Espaço vertical entre os campos.
                  TextField(
                    // Campo para inserção da senha.
                    obscureText: true, // Oculta o conteúdo digitado.
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30), // Espaço vertical antes do botão.
                  ElevatedButton(
                    // Botão para submeter o formulário.
                    onPressed: () {
                      // Navegação para a tela de login após o cadastro.
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(
                          255, 231, 130, 163), // Estilo do botão.
                      minimumSize: Size(300, 50),
                    ),
                    child: Text(
                      'Criar Conta',
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
