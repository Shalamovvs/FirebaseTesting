import 'package:flutter/material.dart';
import 'package:new_application/models/Task.dart';
import 'package:select_form_field/select_form_field.dart';

class DetailTask extends StatelessWidget {
  final Task task;

  DetailTask({required this.task});

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'ToDo',
      'label': 'ToDo',
      'icon': Icon(Icons.looks_one),
    },
    {
      'value': 'Progress',
      'label': 'Progress',
      'icon': Icon(Icons.looks_two),
    },
    {
      'value': 'Testing',
      'label': 'Testing',
      'icon': Icon(Icons.looks_3),
    },
    {
      'value': 'Done',
      'label': 'Done',
      'icon': Icon(Icons.looks_4),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('ID:${task.id}', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${task.name}', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${task.author}', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${task.description}', style: TextStyle(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: SelectFormField(
                  type: SelectFormFieldType.dropdown,
                  initialValue: '${task.status}',
                  labelText: 'Статус',
                  items: _items,
                  onChanged: (val) {
                    task.status = val;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, 
                child: Text('Сохранить', style: TextStyle(fontSize: 16))
              )
            ],
          ),
        )
      ),
    );
  }
}

