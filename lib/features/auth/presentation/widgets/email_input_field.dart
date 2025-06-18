import 'package:flutter/material.dart';


class EmailInputField extends StatelessWidget {
  final TextEditingController controller;

  const EmailInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: const Color(
            0XFFC4C4C4,
          ), 
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: InputBorder.none, 

          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: 'mail',
          prefixIcon:
              Icon(Icons.mail_outline), 
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
      ),
    );
  }
}
