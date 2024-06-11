import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Emailchanges extends LoginEvent {
  final String email;
  Emailchanges({required this.email});
  @override
  // TODO: implement props
  List<Object?> get props => [email];
}

class Passwordchange extends LoginEvent {
  final String password;
  Passwordchange({required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [password];
}

class Loginapi extends LoginEvent {}
