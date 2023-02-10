



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';



part 'register_state.g.dart';


abstract class RegisterState implements Built<RegisterState,
    RegisterStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;



  RegisterState._();

  factory RegisterState([void Function(RegisterStateBuilder) updates]) = _$RegisterState;

  factory RegisterState.initial() {
    return RegisterState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''


    );
  }
}


