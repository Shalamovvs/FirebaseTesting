import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class SubmitPasswordForm extends StatelessWidget {

  final TextEditingController controller;

  SubmitPasswordForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        onEditingComplete: () {
          if (controller.text == '' || controller.text.length < 4)
          {
            showSimpleNotification(
              Center(
                child: Text("Проверьте правильность ввода пароля", style: TextStyle(color: Colors.white))
              ),
              background: Colors.blue
            );
            controller.clear();
          }
        },
        decoration: InputDecoration(
          hintText: 'Подтвердите пароль'
        ),
      ),
    );
  }
}