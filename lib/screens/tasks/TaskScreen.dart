import 'package:flutter/material.dart';
import 'package:new_application/models/User.dart';
import 'package:new_application/screens/tasks/CreateTask.dart';
import 'package:new_application/screens/tasks/DetailTask.dart';

class TaskScreen extends StatelessWidget {
  final UserData user;
  final String status;

  TaskScreen({required this.user, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (status == 'ToDo')
          {
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => CreateTask()),
            );
          }
          else
          {
            null;
          }
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, size: 35, color: Colors.white),
      ),
          body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: user.tasks.length,
              itemBuilder: (context, index) {
                if (user.tasks[index].status == status) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => DetailTask(task: user.tasks[index])),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                              child: Text('${user.tasks[index].id}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                              child: Text('${user.tasks[index].name}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                              child: Text('${user.tasks[index].author}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
