import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_application/screens/HomeScreen.dart';
import 'package:new_application/widgets/formFields/EmailForm.dart';
import 'package:new_application/widgets/formFields/PassowrdForm.dart';
import 'package:overlay_support/overlay_support.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final databaseReference = FirebaseDatabase.instance.reference();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Column(
        children: <Widget>[
          EmailForm(controller: emailController),
          PasswordForm(controller: passwordController),
          ElevatedButton(
            onPressed: () async {
              try {
                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text
                );
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(builder: (_) => HomeScreen()),
                );
                // databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").once().then((DataSnapshot snapshot) {
                //   Map<String, dynamic> data = new Map<String, dynamic>.from(snapshot.value);
                //   UserData user = UserData.fromMap(data);
                //   Navigator.of(context).pushReplacement(
                //     MaterialPageRoute<void>(builder: (_) => HomeScreen(user: user)),
                //   );
                // });
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  showSimpleNotification(
                    Center(
                      child: Text("Полльзователь с данным логином не найден", style: TextStyle(color: Colors.white))
                    ),
                    background: Colors.blue
                  );
                } else if (e.code == 'wrong-password') {
                  showSimpleNotification(
                    Center(
                      child: Text("Проверьте правильность ввода пароля", style: TextStyle(color: Colors.white))
                    ),
                    background: Colors.blue
                  );
                }
              }
            },
            child: Text('Подтвердить')
          )
        ],
      ),
    );
  }
}