import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class LastnameForm extends StatelessWidget {

  final TextEditingController controller;
  final String? lastname;

  LastnameForm({required this.controller, this.lastname});

  @override
  Widget build(BuildContext context) {
    if (lastname != null)
    {
      controller.text = lastname!;
    }
    else
    {
      
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.name,
        controller: controller,
        onEditingComplete: () {
          if (controller.text == '' || controller.text.length < 2)
          {
            showSimpleNotification(
              Center(
                child: Text("Проверьте правильность ввода фамилии", style: TextStyle(color: Colors.white))
              ),
              background: Colors.blue
            );
            controller.clear();
          }
        },
        decoration: InputDecoration(
          hintText: 'Фамилия'
        ),
      ),
    );
  }
}