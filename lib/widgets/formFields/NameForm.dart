import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NameForm extends StatelessWidget {

  final TextEditingController controller;
  final String? name;

  NameForm({required this.controller, this.name});

  @override
  Widget build(BuildContext context) {
    if (name != null)
    {
      controller.text = name!;
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
                child: Text("Проверьте правильность ввода имени", style: TextStyle(color: Colors.white))
              ),
              background: Colors.blue
            );
            controller.clear();
          }
        },
        decoration: InputDecoration(
          hintText: 'Имя'
        ),
        
      ),
    );
  }
}