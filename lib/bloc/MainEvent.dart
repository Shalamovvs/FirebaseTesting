import 'package:equatable/equatable.dart';
import 'package:new_application/models/User.dart';

abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MainLoad extends MainEvent {}

class MainEdit extends MainEvent {
  final String name;
  final String lastname;

  MainEdit({required this.lastname, required this.name});

  @override
	List<Object> get props => [name, lastname];
}

class MainCreateTask extends MainEvent {
  final String title;
  final String discription;
  final UserData user;

  MainCreateTask({required this.title, required this.discription, required this.user});

  @override
	List<Object> get props => [title, discription, user];
}
