import 'package:flutter/material.dart';

class ListaUser extends StatelessWidget {
  const ListaUser({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: 'Digite seu'),
    );
  }
}
