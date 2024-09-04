import 'package:cadastro_basico/models/user_model.dart';
import 'package:cadastro_basico/view/show_users_screen.dart';
import 'package:flutter/material.dart';

class CadastroUser extends StatelessWidget {
  CadastroUser({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [];

    void salvaInfo() {
      users.add(UserModel(
          name: nameController.text,
          email: emailController.text,
          telefone: telefoneController.text,
          endereco: enderecoController.text));

      print(users.length);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Cadastro",
            style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: telefoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefone',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: enderecoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Endereço',
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    salvaInfo();
                  },
                  child: Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (users.isNotEmpty) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowUsersScreen(
                            users: users,
                          ),
                        ),
                      );
                    } else {
                      const SnackBar(
                        content:
                            Text('Precisa cadastrar pelo menos 1 usuário!'),
                      );
                    }

                    salvaInfo();
                  },
                  child: Text("Ver"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
