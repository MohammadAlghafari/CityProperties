



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';



part 'home_state.g.dart';


abstract class HomeState implements Built<HomeState,
    HomeStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  int get page;



  HomeState._();

  factory HomeState([void Function(HomeStateBuilder) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
      ..page=0


    );
  }
}


