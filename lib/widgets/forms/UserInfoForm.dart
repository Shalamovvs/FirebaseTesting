import 'package:flutter/material.dart';
import 'package:new_application/models/User.dart';

class UserInfoForm extends StatelessWidget {
  final UserData user;

  UserInfoForm({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Имя: ${user.name}', style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Фамилия: ${user.lastname}', style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Email: ${user.email}', style: TextStyle(fontSize: 16, color: Colors.white)),
          )
        ],
      ),
    );
  }
}