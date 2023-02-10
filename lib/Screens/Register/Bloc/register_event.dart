part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object> get props => [];
}

class RegisterEventSubmit extends RegisterEvent {
  final String userName;
  final String emiratesId;
  final String pwd;

  const RegisterEventSubmit({
    required this.userName,
    required this.emiratesId,
    required this.pwd
  });



}


