part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class InitialState extends RegisterState{}

final class RegisterInitialState extends RegisterState {
  String id;
  int token;

  RegisterInitialState({required this.id, required this.token});
}

final class InitialNewUserState extends RegisterState {
  bool newScreen;
  String textToUser;


  InitialNewUserState({required this.textToUser, required this.newScreen});

}