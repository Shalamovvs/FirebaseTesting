import 'package:equatable/equatable.dart';
import 'package:new_application/models/User.dart';

abstract class MainState extends Equatable{
  MainState();

	@override
	List<Object> get props => [];
}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainFailure extends MainState {
  final String title;
  final String text;

  MainFailure({required this.title,required this.text});

  @override
	List<Object> get props => [title, text];
}

class MainSuccess extends MainState{
  final UserData userData;

  MainSuccess({required this.userData});

  @override
	List<Object> get props => [userData];
}