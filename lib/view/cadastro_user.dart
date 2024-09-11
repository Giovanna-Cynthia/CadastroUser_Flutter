import 'package:cadastro_basico/models/user_model.dart';
import 'package:cadastro_basico/view/show_users_screen.dart';
import 'package:flutter/material.dart';

enum Genero { masculino, feminino }

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  // Variável para armazenar o gênero selecionado
  Genero? _generoSelecionado;

  // Lista para armazenar os usuários
  List<UserModel> users = [];

  void mostraInfo() {
    // Armazena o gênero selecionado como string
    String genero =
        _generoSelecionado == Genero.masculino ? 'Masculino' : 'Feminino';

    // Adiciona o usuário na lista
    users.add(UserModel(
      name: nameController.text,
      email: emailController.text,
      telefone: int.tryParse(telefoneController.text) ?? 0,
      endereco: enderecoController.text,
      genero: genero,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Cadastro",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: telefoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefone',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: enderecoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Endereço',
              ),
            ),
          ),
          Column(
            children: <Widget>[
              RadioListTile<Genero>(
                value: Genero.masculino,
                groupValue: _generoSelecionado,
                onChanged: (Genero? value) {
                  setState(() {
                    _generoSelecionado = value;
                  });
                },
                title: const Text('Masculino'),
              ),
              RadioListTile<Genero>(
                value: Genero.feminino,
                groupValue: _generoSelecionado,
                onChanged: (Genero? value) {
                  setState(() {
                    _generoSelecionado = value;
                  });
                },
                title: const Text('Feminino'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (users.isNotEmpty) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ShowUsersScreen(
                              users: users,
                            ),
                          ));
                        } else {
                          const snackBar = SnackBar(
                            content:
                                Text('Precisa cadastrar pelo menos 1 usuário'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text("Mostrar"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        mostraInfo();
                      },
                      child: const Text("Salvar"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
