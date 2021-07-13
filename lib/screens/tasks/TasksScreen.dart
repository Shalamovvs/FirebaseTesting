import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_application/models/User.dart';
import 'package:new_application/screens/tasks/TaskScreen.dart';

class TasksScreen extends StatelessWidget {
  final UserData user;

  TasksScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CupertinoTabScaffold(
          tabBar : CupertinoTabBar(
            items: <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one),
                label: 'ToDo'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two),
                label: 'In Progress'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_3),
                label: 'Testing'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_4),
                label: 'Done'
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return TaskScreen(user: user, status: 'ToDo');
              case 1:
                return TaskScreen(user: user, status: 'In Progress');
              case 2:
                return TaskScreen(user: user, status: 'Testing');
              case 3:
                return TaskScreen(user: user, status: 'Done');
              default:
                return TaskScreen(user: user, status: 'ToDo');
            }
          },
        )
      ),
    );
  }
}