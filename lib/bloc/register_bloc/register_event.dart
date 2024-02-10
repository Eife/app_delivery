part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class MainScreenRegisterEvent extends RegisterEvent {
  String phone;

  MainScreenRegisterEvent({required this.phone});

}

class VerifySentOtpEvent extends RegisterEvent {
  String phone;
  String token;

  VerifySentOtpEvent({required this.phone, required this.token});

}