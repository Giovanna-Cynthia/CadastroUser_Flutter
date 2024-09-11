import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  final int selectedGender; 
  final Function(int) onGenderChanged; 

  const GenderSelection({
    Key? key,
    required this.selectedGender,
    required this.onGenderChanged,
  }) : super(key: key);

  @override
  _ButtonGenderState createState() => _ButtonGenderState();
}

class _ButtonGenderState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<int>(
          title: const Text('Masculino'),
          value: 1,
          groupValue: widget.selectedGender,
          onChanged: (int? value) {
            if (value != null) {
              widget.onGenderChanged(value); 
            }
          },
        ),
        RadioListTile<int>(
          title: const Text('Feminino'),
          value: 2,
          groupValue: widget.selectedGender, 
          onChanged: (int? value) {
            if (value != null) {
              widget.onGenderChanged(value); 
            }
          },
        ),
      ],
    );
  }
}