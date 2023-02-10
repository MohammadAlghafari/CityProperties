



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobDetailsModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobMaterialDataModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/MaintenanceHistoryModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/TechDate.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsDetailsModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';



part 'maintenance_state.g.dart';


abstract class MaintenanceState implements Built<MaintenanceState,
    MaintenanceStateBuilder> {


  bool? get isSuccess;
  bool? get isLoading;
  bool? get isLoadingJobInfo;
  String? get errorJobInfo;
  String? get error;
  bool? get isLoadingDetails;
  String? get errorDetails;
  MaintenanceHistoryModel? get maintenanceHistoryModel;
  MaintenanceHistoryModel? get filterMaintenanceHistoryModel;
  TechData get techData;
  JobMaterialDataModel get jobMaterialDataModel;
  JobDetailsModel get jobDetailsModel;


  MaintenanceState._();

  factory MaintenanceState([void Function(MaintenanceStateBuilder) updates]) = _$MaintenanceState;

  factory MaintenanceState.initial() {
    return MaintenanceState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..error=''
      ..isLoadingJobInfo = false
    ..isLoadingDetails=false
      ..errorJobInfo=''
      ..jobDetailsModel=JobDetailsModel(
        listJobDetails:[]
      )
      ..errorDetails=''
     ..maintenanceHistoryModel=MaintenanceHistoryModel(
       listMaintenanceHistory: []
     )
      ..filterMaintenanceHistoryModel=MaintenanceHistoryModel(
          listMaintenanceHistory: []
      )
        ..techData=TechData(
          technician: []
        )
        ..jobMaterialDataModel=JobMaterialDataModel(
          listJobMaterial: []
        )



    );
  }
}


