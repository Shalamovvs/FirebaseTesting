import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class EmailForm extends StatelessWidget {

  final TextEditingController controller;

  EmailForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        onEditingComplete: () {
          if (controller.text == '' || controller.text.length < 2 || !controller.text.contains('@') || !controller.text.contains('.'))
          {
            showSimpleNotification(
              Center(
                child: Text("Проверьте правильность ввода почты", style: TextStyle(color: Colors.white))
              ),
              background: Colors.blue
            );
            controller.clear();
          }
        },
        decoration: InputDecoration(
          hintText: 'Email'
        ),
      ),
    );
  }
}