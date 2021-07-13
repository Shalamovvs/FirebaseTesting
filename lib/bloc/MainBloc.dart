import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/bloc/MainEvent.dart';
import 'package:new_application/bloc/MainState.dart';
import 'package:new_application/models/Task.dart';
import 'package:new_application/models/User.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    add(MainLoad());
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    yield MainLoading();
    yield MainSuccess(userData: await _loadUser());

    if (event is MainEdit)
    {
      yield MainLoading();
      _editUser(event.name, event.lastname);
      yield MainSuccess(userData: await _loadUser());
    }

    if (event is MainCreateTask)
    {
      yield MainLoading();
      _createTask(event.discription, event.title, event.user);
      yield MainSuccess(userData: await _loadUser());
    }
  }
}

void _editUser(String newName, String newLastname) async {
  final databaseReference = FirebaseDatabase.instance.reference();
  databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").update({
    'name': '$newName',
    'lastname': '$newLastname'
  });
}

void _createTask(String description, String title, UserData user) async {
  final databaseReference = FirebaseDatabase.instance.reference();
  await databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}/tasks/${user.tasks.length}").update({
    'name': '$title',
    'description': '$description',
    'id': user.tasks.length,
    'author': '${user.name} ${user.lastname}',
    'status': 'ToDo',
  });
}

Future<UserData> _loadUser() async {
  final databaseReference = FirebaseDatabase.instance.reference();

  return databaseReference.child("${FirebaseAuth.instance.currentUser!.uid}").once().then((DataSnapshot snapshot) {
    Map<String, dynamic> data = new Map<String, dynamic>.from(snapshot.value);
    
    UserData user =  UserData.fromMap(data);
    return user;
  });
}