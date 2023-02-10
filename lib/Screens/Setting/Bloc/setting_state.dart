



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/Setting/Model/ChangePasswordModel.dart';
import 'package:cityproperties/Screens/Setting/Model/ProfileModel.dart';



part 'setting_state.g.dart';


abstract class SettingState implements Built<SettingState,
    SettingStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isLoadingChange;
  LoginModel? get logOutModel;
  String? get error;
  String? get errorChange;
  ProfileModel? get profileModel;
  ChangePasswordModel? get changePasswordModel;

  SettingState._();

  factory SettingState([void Function(SettingStateBuilder) updates]) = _$SettingState;

  factory SettingState.initial() {
    return SettingState((b) => b
      ..isLoading = true
      ..isLoadingChange=false
      ..isSuccess = false
      ..error=''
      ..errorChange=''
        ..profileModel=ProfileModel(
          listProfileModel: []
        )
        ..changePasswordModel=ChangePasswordModel(
          listChangePassword: []
        )
        ..logOutModel=LoginModel(
          listLogin: []
        )


    );
  }
}


