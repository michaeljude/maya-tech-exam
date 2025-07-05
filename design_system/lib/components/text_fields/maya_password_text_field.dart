import 'package:flutter/material.dart';

class MayaPasswordTextField extends StatefulWidget {
  const MayaPasswordTextField({
    required this.controller,
    required this.labelText,
    required this.validator,
    super.key,
  });

  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  @override
  State<MayaPasswordTextField> createState() => _MayaPasswordTextFieldState();
}

class _MayaPasswordTextFieldState extends State<MayaPasswordTextField> {
  var _obscureText = true;

  @override
  Widget build(final BuildContext context) => TextFormField(
    controller: widget.controller,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
      labelStyle: const TextStyle(color: Colors.black38),
      floatingLabelStyle: const TextStyle(color: Colors.black),
      labelText: widget.labelText,
      suffixIcon: IconButton(
        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    ),
    obscureText: _obscureText,
    keyboardType: TextInputType.visiblePassword,
    validator: widget.validator,
  );
}
