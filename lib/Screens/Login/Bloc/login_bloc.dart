import 'dart:async';
import 'dart:io';

import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/Login/Api/LoginRemote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import '../../../translations/locale_keys.g.dart';
import 'login_state.dart';


part 'login_event.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRemoteDataSource loginRemoteDataSource;

  LoginBloc({
    required this.loginRemoteDataSource
   }) : super(LoginState.initial()) {
    on<LoginEventSubmit>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..error=''
        ));
      final result = await loginRemoteDataSource.login(
        name: event.username,
        password: event.password,
        userId: 0
      );
      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        if(r.listLogin![0].result =='200')
          {
            Preferences.preferences!
            .setString(KeyConstants.keyUserId,r.listLogin![0].tenantcode!);
            Preferences.preferences!
                .setString(KeyConstants.keyPidNo,r.listLogin![0].pidno!);
            Preferences.preferences!.setString(KeyConstants.keyUserName,event.username);
            Preferences.preferences!.setString(KeyConstants.keyPassword,event.password);
            emit(state.rebuild((b) => b
              ..isSuccess = true
              ..isLoading = false
              ..loginModel = r));

          }
        else{
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error=LocaleKeys.msg_user_pass_wrong.tr()
          ));
        }

      });
    });
  }


}

