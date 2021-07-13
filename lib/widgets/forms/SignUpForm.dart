import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_application/screens/auth/SignInScreen.dart';
import 'package:new_application/widgets/formFields/EmailForm.dart';
import 'package:new_application/widgets/formFields/LastnameForm.dart';
import 'package:new_application/widgets/formFields/NameForm.dart';
import 'package:new_application/widgets/formFields/PassowrdForm.dart';
import 'package:new_application/widgets/formFields/SubmitPasswordForm.dart';
import 'package:overlay_support/overlay_support.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final databaseReference = FirebaseDatabase.instance.reference();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController submitPasswordController = new TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    submitPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NameForm(controller: nameController),
          LastnameForm(controller: lastnameController),
          EmailForm(controller: emailController),
          PasswordForm(controller: passwordController),
          SubmitPasswordForm(controller: submitPasswordController),
          ElevatedButton(
            onPressed: () async {
              if (passwordController.text == submitPasswordController.text)
              {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text
                  );
                  databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").set({
                    'name': nameController.text,
                    'lastname': lastnameController.text,
                    'email': emailController.text
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(builder: (_) => SignInScreen()),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    showSimpleNotification(
                      Center(
                        child: Text("Пользователь с этим Email адрессом уже существует", style: TextStyle(color: Colors.white))
                      ),
                      background: Colors.blue
                    );
                  }
                } catch (e) {
                  print(e);
                }
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
            child: Text('Подтвердить')
          )
        ],
      ),
    );
  }
}