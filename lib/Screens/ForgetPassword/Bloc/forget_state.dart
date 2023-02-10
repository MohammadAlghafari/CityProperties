



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';



part 'forget_state.g.dart';


abstract class ForgetState implements Built<ForgetState,
    ForgetStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  ForgetPasswordModel? get forgetPasswordModel;


  ForgetState._();

  factory ForgetState([void Function(ForgetStateBuilder) updates]) = _$ForgetState;

  factory ForgetState.initial() {
    return ForgetState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
      ..forgetPasswordModel=ForgetPasswordModel(
         listForget: []
      )

    );
  }
}


