import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_application/bloc/MainBloc.dart';
import 'package:new_application/bloc/MainEvent.dart';
import 'package:new_application/bloc/MainState.dart';
import 'package:new_application/widgets/formFields/LastnameForm.dart';
import 'package:new_application/widgets/formFields/NameForm.dart';

class EditUserData extends StatelessWidget {

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          child: BlocBuilder<MainBloc,MainState>(
            bloc: BlocProvider.of<MainBloc>(context),
            builder: (context, state) {
              if (state is MainSuccess)
              {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    NameForm(controller: nameController, name: state.userData.name),
                    LastnameForm(controller: lastnameController, lastname: state.userData.lastname),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<MainBloc>(context).add(
                          MainEdit(name: nameController.text, lastname: lastnameController.text)
                        );
                        Navigator.of(context).pop();
                      }, 
                      child: Text('Сохранить', style: TextStyle(fontSize: 16))
                    )
                  ],
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
          ),
        ),
      ),
    );
  }
}