import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_application/models/User.dart';
import 'package:new_application/screens/auth/SignInScreen.dart';
import 'package:new_application/screens/profile/ChangePasswordScreen.dart';
import 'package:new_application/screens/profile/EditUserData.dart';
import 'package:new_application/widgets/forms/UserInfoForm.dart';

class ProfileScreen extends StatelessWidget {
  final UserData user;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              UserInfoForm(user: user),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => ChangePasswordScreen()),
                      );
                    }, 
                    child: Text('Сменить пароль', style: TextStyle(fontSize: 16))
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => EditUserData()),
                      );
                    }, 
                    child: Text('Редактировать', style: TextStyle(fontSize: 16))
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(builder: (_) => SignInScreen()),
                  );
                }, 
                child: Text('Выйти', style: TextStyle(fontSize: 16))
              ),
            ],
          ),
        )
      ),
    );
  }
}
