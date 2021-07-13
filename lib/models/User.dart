import 'dart:convert';

import 'package:new_application/models/Task.dart';

class UserData {

  final String name;

  final String lastname;

  final String email;

  List<Task> tasks;


  UserData({
    required this.lastname,
    required this.email,
    required this.name,
    required this.tasks,
  });

  static UserData fromMap(Map<String, dynamic> map) => UserData(
    name: map["name"],
    lastname: map["lastname"],
    email: map["email"],
    tasks: (map["tasks"] as List<dynamic>).map((item) => Task.fromMap(item)).toList(),
  );
}