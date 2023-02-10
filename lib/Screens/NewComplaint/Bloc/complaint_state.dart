



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsDetailsModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ComplaintData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/LocationData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ResultModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ServiceTypeModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';



part 'complaint_state.g.dart';


abstract class ComplaintState implements Built<ComplaintState,
    ComplaintStateBuilder> {


  bool? get isSuccess;
  bool? get isSuccessSpotUnit;
  bool? get isSuccessComplaint;
  bool? get isLoading;
  String? get error;
  MyRentalsModel? get myRentalsModel;
  ServiceTypeModel? get serviceTypeModel;
  LocationData? get locationData;
  ComplaintData get complaintData;
  String? get imagePath;
  ResultData? get resultData;


  ComplaintState._();

  factory ComplaintState([void Function(ComplaintStateBuilder) updates]) = _$ComplaintState;

  factory ComplaintState.initial() {
    return ComplaintState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isSuccessSpotUnit = false
      ..isSuccessComplaint= false
      ..error=''
      ..imagePath=''
     ..myRentalsModel=MyRentalsModel(
       listMyRentals: []
     )
        ..serviceTypeModel=ServiceTypeModel(
          listServiceType: []
        )
        ..locationData=LocationData(
          listLocation: []
        )
        ..complaintData=ComplaintData(
          listComplaint: []
        )
        ..resultData=ResultData(
          status: '',
          contact_no: ''
        )
    );
  }
}


