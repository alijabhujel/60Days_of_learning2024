import 'package:equatable/equatable.dart';

enum Loginstatus { initial, loading, success, error }

class LoginStates extends Equatable {
  final String email;
  final String password;
  final Loginstatus loginstatus;
  final String message;
  LoginStates(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.loginstatus = Loginstatus.initial});

  LoginStates copyWith(
      {String? email,
      String? password,
      String? message,
      Loginstatus? loginstatus}) {
    return LoginStates(
        email: email ?? this.email,
        password: password ?? this.password,
        message: message ?? this.message,
        loginstatus: loginstatus ?? this.loginstatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, message, loginstatus];
}
