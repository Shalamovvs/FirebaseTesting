import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/bloc/MainBloc.dart';
import 'package:new_application/bloc/MainEvent.dart';
import 'package:new_application/bloc/MainState.dart';
import 'package:overlay_support/overlay_support.dart';

class CreateTask extends StatelessWidget {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: titleController,
                    onEditingComplete: () {
                      if (titleController.text == '')
                      {
                        showSimpleNotification(
                          Center(
                            child: Text("Проверьте правильность ввода названия", style: TextStyle(color: Colors.white))
                          ),
                          background: Colors.blue
                        );
                        titleController.clear();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Название'
                    ),
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: descriptionController,
                    onEditingComplete: () {
                      if (descriptionController.text == '')
                      {
                        showSimpleNotification(
                          Center(
                            child: Text("Проверьте правильность ввода Описания", style: TextStyle(color: Colors.white))
                          ),
                          background: Colors.blue
                        );
                        descriptionController.clear();
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Описание'
                    ),
                    
                  ),
                ),
                BlocBuilder<MainBloc,MainState>(
                  bloc: BlocProvider.of<MainBloc>(context),
                  builder: (context, state) {
                    if (state is MainSuccess)
                    {
                      return ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<MainBloc>(context).add(
                            MainCreateTask(title: titleController.text, discription: descriptionController.text, user: state.userData)
                          );
                          Navigator.of(context).pop();
                        }, 
                        child: Text('Сохранить', style: TextStyle(fontSize: 18))
                      );
                    }
                    else
                    {
                      return Container();
                    }
                  },
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}