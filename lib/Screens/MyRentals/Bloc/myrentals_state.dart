



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsDetailsModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';



part 'myrentals_state.g.dart';


abstract class MyRentalsState implements Built<MyRentalsState,
    MyRentalsStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  String? get error;
  MyRentalsModel? get myRentalsModel;
  bool? get isLoadingDetails;
  String? get errorDetails;
  MyRentalsDetailsModel? get myRentalsDetailsModel;
  VacantUnitModel? get vacantUnitModel;


  MyRentalsState._();

  factory MyRentalsState([void Function(MyRentalsStateBuilder) updates]) = _$MyRentalsState;

  factory MyRentalsState.initial() {
    return MyRentalsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
        ..isLoadingDetails=false
      ..errorDetails=''

     ..myRentalsModel=MyRentalsModel(
       listMyRentals: []
     )

        ..vacantUnitModel=VacantUnitModel(
            listVacantUnit: []
        )


    );
  }
}


