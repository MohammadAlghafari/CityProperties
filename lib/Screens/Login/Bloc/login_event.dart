part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEventSubmit extends LoginEvent {
  final String username;
  final String password;

  const LoginEventSubmit({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];

}

class LoginEventCall extends LoginEvent {
  final String number;

  const LoginEventCall({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}

class LoginEventLanguage extends LoginEvent {

  LoginEventLanguage();

  @override
  // TODO: implement props
  List<Object> get props =>  [];

}
