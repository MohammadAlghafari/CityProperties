



import 'package:cityproperties/Screens/DashBoardPage/Pages/Announcement/Api/AnnouncementRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/Announcement/Model/AnnouncementModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Api/ChequeReturnRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Model/ChequeReturnModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Api/DuePaymentDaysRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Api/DuePaymentImageRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Model/DuePaymentImageModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Model/DuePaymentModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/Api/MonthlyPaymentRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/Model/MonthlyPaymentModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/TenantStatement/Api/TenantStateRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/TenantStatement/Model/TenantStateModel.dart';
import 'package:cityproperties/Screens/Register/Api/RegisterRemote.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../translations/locale_keys.g.dart';
import 'dashboard_state.dart';


part 'dashboard_event.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  AnnouncementRemoteDataSource announcementRemoteDataSource;
  TenantStatementRemoteDataSource tenantStatementRemoteDataSource;
  DuePaymentDataSource duePaymentDataSource;
  DuePaymentImageDataSource duePaymentImageDataSource;
  ChequeReturnDataSource chequeReturnDataSource;
  MonthlyPaymentDataSource monthlyPaymentDataSource;

  DashboardBloc({
    required this.announcementRemoteDataSource,
    required this.tenantStatementRemoteDataSource,
    required this.duePaymentDataSource,
    required this.duePaymentImageDataSource,
    required this.chequeReturnDataSource,
    required this.monthlyPaymentDataSource
   }) : super(DashboardState.initial()) {
    on<GetAnnouncementEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
          ..error=''
          ..announcementModel=AnnouncementModel(
            listAnnouncement: []
          )
        ));
      final result = await announcementRemoteDataSource.getAnnouncement(
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..announcementModel=r
          ));


      });
    });


    on<GetTenantEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error=''
        ..tenantStateModel=TenantStateModel(
            listTenant: []
        )
      ));
      final result = await tenantStatementRemoteDataSource.getTenantStatement(
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..tenantStateModel = r
          ..isLoading=false
        ));


      });
    });




    on<GetDuePaymentEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error=''
        ..errorImage=''
        ..duePaymentImageModel=DuePaymentImageModel(
          listDuePaymentImage: []
        )
        ..duePaymentModel=DuePaymentModel(
            listDuePayment: []
        )
      ));
      final result = await duePaymentDataSource.getDuePayment(
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..duePaymentModel = r
          ..isLoading=false
        ));


      });
    });


    on<GetDuePaymentImageEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoadingImage = true
        ..errorImage=''
        ..duePaymentImageModel=DuePaymentImageModel(
            listDuePaymentImage: []
        )
      ));
      final result = await duePaymentImageDataSource.getDuePaymentImage(
        chequeNo: event.chqueNo,
        contractNo: event.contractNo
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoadingImage = false
          ..errorImage = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..duePaymentImageModel = r
          ..isLoadingImage=false
        ));


      });
    });


    on<GetChequeReturnEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error=''
        ..chequeReturnModel=ChequeReturnModel(
           listChequeReturn: []
        )
      ));
      final result = await chequeReturnDataSource.getChequeReturn(
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..chequeReturnModel = r
          ..isLoading=false
        ));


      });
    });

    on<GetMonthlyPaymentEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isLoading = true
        ..error=''
        ..monthlyPaymentModel=MonthlyPaymentModel(
            listMonthlyPayment: []
        )
      ));
      final result = await monthlyPaymentDataSource.getMonthlyPayment(
      );
      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        emit(state.rebuild((b) => b
          ..monthlyPaymentModel = r
          ..isLoading=false
        ));


      });
    });



  }


}

