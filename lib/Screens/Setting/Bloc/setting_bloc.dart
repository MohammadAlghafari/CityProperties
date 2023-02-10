



import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/Login/Api/LoginRemote.dart';
import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/Register/Api/RegisterRemote.dart';
import 'package:cityproperties/Screens/Setting/Api/ChangePasswordRemote.dart';
import 'package:cityproperties/Screens/Setting/Api/ProfileRemote.dart';
import 'package:cityproperties/Screens/Setting/Model/ChangePasswordModel.dart';
import 'package:cityproperties/Screens/Setting/Model/ProfileModel.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../translations/locale_keys.g.dart';
import 'setting_state.dart';


part 'setting_event.dart';


class SettingBloc extends Bloc<SettingEvent, SettingState> {
  ProfileRemoteDataSource profileRemoteDataSource;
  ChangePasswordRemoteDataSource changePasswordRemoteDataSource;
  LoginRemoteDataSource loginRemoteDataSource;

  SettingBloc({
    required this.profileRemoteDataSource,
    required this.changePasswordRemoteDataSource,
    required this.loginRemoteDataSource
   }) : super(SettingState.initial()) {
    on<GetProfileEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
          ..error=''
          ..profileModel=ProfileModel(
            listProfileModel: []
          )

        ));
      final data = await profileRemoteDataSource.getProfile(
      );
      print("result");
      print(data);
      print("result");

      return data.fold((left) async {
        print('left');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = left));
      }, (right) async {
        print('r');
          emit(state.rebuild((b) => b
            ..isLoading = false
             ..profileModel=right
          ));

      });
    });
    on<ChangePasswordEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoadingChange = true
        ..errorChange=''
        ..changePasswordModel=ChangePasswordModel(
            listChangePassword: []
        )

      ));
      final data = await changePasswordRemoteDataSource.changePassword(
        newPassword: event.newPassword,
        oldPassword: event.oldPassword

      );
      return data.fold((left) async {
        print('left');
        emit(state.rebuild((b) => b
          ..isLoadingChange = false
          ..errorChange = left));
      }, (right) async {
              print('r');
              emit(state.rebuild((b) => b
                ..isLoadingChange = false
                ..changePasswordModel=right
              ));
      });
    });


    on<LogOutEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
        ..error=''
      ));
      final result = await loginRemoteDataSource.login(
          name: "",
          password: "",
          userId: Preferences.preferences!.getString(KeyConstants.keyUserId)
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
          Preferences.preferences!.remove(KeyConstants.keyPidNo);
          Preferences.preferences!.remove(KeyConstants.keyUserToken);
          Preferences.preferences!.remove(KeyConstants.keyUserId);
          Preferences.preferences!.remove(KeyConstants.keyPassword);
          Preferences.preferences!.remove(KeyConstants.keyUserName);
          emit(state.rebuild((b) => b
            ..isSuccess = true
            ..isLoading = false
            ..logOutModel = r));
          emit(state.rebuild((b) => b

            ..logOutModel = LoginModel(
              listLogin: []
            )));

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

