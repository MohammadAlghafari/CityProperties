import 'package:cityproperties/Screens/Maintenance/Api/JobDetailsRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/JobMaterialRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/MaintenanceHistoryRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/TechDetailsRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobDetailsModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobMaterialDataModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/MaintenanceHistoryModel.dart';
import 'package:cityproperties/Screens/Maintenance/Model/TechDate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'maintenance_state.dart';

part 'maintenance_event.dart';

class MaintenanceBloc extends Bloc<MaintenanceEvent, MaintenanceState> {
  MaintenanceHistoryDataSource maintenanceHistoryDataSource;
  TechDetailsDataSource techDetailsDataSource;
  JobMaterialDataSource jobMaterialDataSource;
  JobDetailsDataSource jobDetailsDataSource;
  MaintenanceBloc({
    required this.maintenanceHistoryDataSource,
    required this.techDetailsDataSource,
    required this.jobMaterialDataSource,
    required this.jobDetailsDataSource
  }) : super(MaintenanceState.initial()) {
    on<GetMaintenanceHistoryEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error = ''
        ..maintenanceHistoryModel =
            MaintenanceHistoryModel(listMaintenanceHistory: [])
        ..filterMaintenanceHistoryModel =
            MaintenanceHistoryModel(listMaintenanceHistory: [])));
      final result = await maintenanceHistoryDataSource.getMaintenanceHistory(
          shortCode: event.shortCode);
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..filterMaintenanceHistoryModel = r
          ..maintenanceHistoryModel = r));
      });
    });

    on<FilterMaintenanceHistoryEvent>((event, emit) async {
      MaintenanceHistoryModel filter =
          MaintenanceHistoryModel(listMaintenanceHistory: []);
      if (event.categoryValue == 'All' && event.statusValue == 'All') {
        filter = state.maintenanceHistoryModel!;
      } else {
        if (state.maintenanceHistoryModel!.listMaintenanceHistory != null) {
          for (var item
              in state.maintenanceHistoryModel!.listMaintenanceHistory!) {
            if ((item.sTATUSNAME!.contains(event.statusValue) ||
                    event.statusValue == 'All') &&
                (item.sERVICETYPENAME!.contains(event.categoryValue) ||
                    event.categoryValue == 'All')) {
              filter.listMaintenanceHistory!.add(item);
            }
          }
        }
      }
      emit(state.rebuild((b) => b..filterMaintenanceHistoryModel = filter));
    });


    on<GetTechDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoadingDetails = true
        ..errorDetails = ''
        ..techData=TechData(
            technician: []
        )
      ));
      final result = await techDetailsDataSource.getTechDetails(
          assignTo: event.assignTo);
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingDetails = false
          ..errorDetails = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..isLoadingDetails = false
          ..techData=r
        ));
      });
    });


    on<GetJobMaterialEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..jobMaterialDataModel= JobMaterialDataModel(
            listJobMaterial: []
        )
      ));
      if(event.status.contains('Completed'))
        {
          final result = await jobMaterialDataSource.getJobMaterial(
            cmdNo: event.cmdNo,
          );
          return result.fold((l) async {
            print('l');
            emit(state.rebuild((b) => b
              ..errorDetails = l
            ));
          }, (r) async {
            print('r');
            emit(state.rebuild((b) => b
              ..jobMaterialDataModel=r
            ));
          });
        }

    });


    on<GetJobDetailsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoadingJobInfo=true
        ..errorJobInfo=''
        ..jobDetailsModel= JobDetailsModel(
            listJobDetails: []
        )
      ));
      final result = await jobDetailsDataSource.getJobDetails(
        jobNo: event.jobNo,
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingJobInfo=false
          ..errorJobInfo=l
        ));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..isLoadingJobInfo=false
            ..errorJobInfo=''
          ..jobDetailsModel=r
        ));
        emit(state.rebuild((b) => b
          ..jobDetailsModel= JobDetailsModel(
              listJobDetails: []
          )
        ));
      });
    });


  }




}
