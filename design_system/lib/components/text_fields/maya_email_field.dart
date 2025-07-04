import 'package:flutter/material.dart';

class MayaEmailField extends StatelessWidget {
  const MayaEmailField({
    required this.controller,
    required this.labelText,
    required this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  Widget build(final BuildContext context) => TextFormField(
    controller: controller,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      labelText: labelText,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
      labelStyle: const TextStyle(color: Colors.black38),
      floatingLabelStyle: const TextStyle(color: Colors.black),
    ),
    keyboardType: TextInputType.emailAddress,
    validator: validator,
  );
}
