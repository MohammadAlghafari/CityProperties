



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';



part 'notification_state.g.dart';


abstract class NotificationState implements Built<NotificationState,
    NotificationStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;

  List<Notifications>? get dataList ;
  List<Notifications>? get todayList ;
  List<Notifications>? get prevList ;



  NotificationState._();

  factory NotificationState([void Function(NotificationStateBuilder) updates]) = _$NotificationState;

  factory NotificationState.initial() {
    return NotificationState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
      ..dataList=[]
      ..todayList=[]
      ..prevList=[]



    );
  }
}


