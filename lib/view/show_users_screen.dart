import 'package:cadastro_basico/models/user_model.dart';
import 'package:flutter/material.dart';

class ShowUsersScreen extends StatelessWidget {
  const ShowUsersScreen({
    super.key,
    required this.users,
  });

  final List<UserModel> users;

  // Função que retorna a imagem baseada no gênero do usuário
  AssetImage imagemUsuario(String genero) {
    if (genero == 'Masculino') {
      return const AssetImage('./assets/images/man.png');
    } else {
      return const AssetImage('./assets/images/woman.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Dados dos Usuários")),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: users.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: 130,
                    child: Card(
                      elevation: 10,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () {
                                // Ação ao tocar na imagem
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: imagemUsuario(users[i].genero),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(75.0),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 7.0,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nome: ${users[i].name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('E-mail: ${users[i].email}'),
                                  Text('Telefone: ${users[i].telefone}'),
                                  Text('Endereço: ${users[i].endereco}'),
                                  Text('Gênero: ${users[i].genero}'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
