part of 'forget_bloc.dart';

abstract class ForgetEvent extends Equatable {
  const ForgetEvent();
  @override
  List<Object> get props => [];
}

class ForgetEventSubmit extends ForgetEvent {
  final String email;
  final String emiratesId;

  const ForgetEventSubmit({
    required this.email,
    required this.emiratesId,
  });



}


