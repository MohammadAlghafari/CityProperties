part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
  @override
  List<Object> get props => [];
}

class GetProfileEvent extends SettingEvent {
}

class LogOutEvent extends SettingEvent {
}


// ignore: must_be_immutable
class ChangePasswordEvent extends SettingEvent {
  String newPassword;
  String oldPassword;
  ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword
   });
}

