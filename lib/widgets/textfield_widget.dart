import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield(this.controller, this.label, {Key? key}) : super(key: key);
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
