



import 'package:built_value/built_value.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';



part 'login_state.g.dart';


abstract class LoginState implements Built<LoginState,
    LoginStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  LoginModel? get loginModel;


  LoginState._();

  factory LoginState([void Function(LoginStateBuilder) updates]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
      ..loginModel=LoginModel(
         listLogin: []
      )

    );
  }
}


