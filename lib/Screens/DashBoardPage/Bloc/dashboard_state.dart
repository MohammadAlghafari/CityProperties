



import 'package:built_value/built_value.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Model/ChequeReturnModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Model/DuePaymentImageModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Model/DuePaymentModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/Model/MonthlyPaymentModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/TenantStatement/Model/TenantStateModel.dart';
import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';

import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';

import '../Pages/Announcement/Model/AnnouncementModel.dart';



part 'dashboard_state.g.dart';


abstract class DashboardState implements Built<DashboardState,
    DashboardStateBuilder> {




  String? get error;
  String? get errorImage;
  bool? get isLoading;

  bool? get isLoadingImage;

  AnnouncementModel? get announcementModel;

  TenantStateModel? get tenantStateModel;

  DuePaymentModel? get duePaymentModel;

  DuePaymentImageModel get duePaymentImageModel;

  ChequeReturnModel get chequeReturnModel;

  MonthlyPaymentModel get monthlyPaymentModel;

  DashboardState._();

  factory DashboardState([void Function(DashboardStateBuilder) updates]) = _$DashboardState;

  factory DashboardState.initial() {
    return DashboardState((b) => b
      ..error=''
      ..errorImage=''
      ..isLoading = false
      ..isLoadingImage=false
        ..announcementModel=AnnouncementModel(
          listAnnouncement: []
        )
        ..tenantStateModel=TenantStateModel(
          listTenant: []
        )
        ..duePaymentModel=DuePaymentModel(
          listDuePayment: []
        )
        ..duePaymentImageModel=DuePaymentImageModel(
          listDuePaymentImage: []
        )
        ..chequeReturnModel=ChequeReturnModel(
          listChequeReturn: []
        )
        ..monthlyPaymentModel=MonthlyPaymentModel(
          listMonthlyPayment: []
        )


    );
  }
}


