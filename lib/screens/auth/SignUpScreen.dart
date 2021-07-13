import 'package:flutter/material.dart';
import 'package:new_application/widgets/forms/SignUpForm.dart';

class SignUpScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Зарегистрироваться', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}