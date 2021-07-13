import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_application/screens/auth/SignInScreen.dart';
import 'package:new_application/widgets/formFields/PassowrdForm.dart';
import 'package:new_application/widgets/formFields/SubmitPasswordForm.dart';
import 'package:overlay_support/overlay_support.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController submitPasswordController = new TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    submitPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PasswordForm(controller: passwordController),
              SubmitPasswordForm(controller: submitPasswordController),
              ElevatedButton(
                onPressed: () {
                  if (passwordController.text == submitPasswordController.text)
                  {
                    FirebaseAuth.instance.currentUser!.updatePassword(passwordController.text);
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(builder: (_) => SignInScreen()),
                    );
                  }
                  else
                  {
                    showSimpleNotification(
                      Center(
                        child: Text("Введенные Вами пароли различаются", style: TextStyle(color: Colors.white))
                      ),
                      background: Colors.blue
                    );
                  }
                }, 
                child: Text('Подтвердить', style: TextStyle(fontSize: 16))
              )
            ],
          ),
        )
      ),
    );
  }
}