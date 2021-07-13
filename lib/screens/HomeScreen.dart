import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/bloc/MainBloc.dart';
import 'package:new_application/bloc/MainState.dart';
import 'package:new_application/screens/profile/ProfileScreen.dart';
import 'package:new_application/screens/tasks/TasksScreen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc,MainState>(
      bloc: BlocProvider.of<MainBloc>(context),
      builder: (context, state) {
        if (state is MainSuccess)
        {
          return CupertinoTabScaffold(
            tabBar : CupertinoTabBar(
              items: <BottomNavigationBarItem> [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Профиль'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.task),
                  label: 'Задачи'
                ),
              ],
            ),
            tabBuilder: (BuildContext context, int index) {
              switch (index) {
                case 0:
                  return ProfileScreen(user: state.userData);
                case 1:
                  return TasksScreen(user: state.userData);
                default:
                return ProfileScreen(user: state.userData);
              }
            },
          );
        }
        if (state is MainLoading)
        {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else
        {
          return Container();
        }
      },
    );
  }
}