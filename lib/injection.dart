import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_bloc.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/Announcement/Api/AnnouncementRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Api/ChequeReturnRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Api/DuePaymentImageRemote.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/Api/MonthlyPaymentRemote.dart';
import 'package:cityproperties/Screens/HomePage/Bloc/home_bloc.dart';
import 'package:cityproperties/Screens/Login/Bloc/login_bloc.dart';
import 'package:cityproperties/Screens/Login/Api/LoginRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/JobDetailsRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/JobMaterialRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/MaintenanceHistoryRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Api/TechDetailsRemote.dart';
import 'package:cityproperties/Screens/Maintenance/Bloc/maintenance_bloc.dart';
import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsDetailsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Api/MyRentalsRemote.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/ComplainDataRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/NewComplainDataRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/ServiceTypeRemote.dart';
import 'package:cityproperties/Screens/NewComplaint/Api/SpotUnitRemote.dart';
import 'package:cityproperties/Screens/Notifications/Api/NotificationRemote.dart';
import 'package:cityproperties/Screens/Notifications/Bloc/notification_bloc.dart';
import 'package:cityproperties/Screens/RateTheWork/Api/MyRateRemote.dart';
import 'package:cityproperties/Screens/RateTheWork/Api/RateJobRemote.dart';
import 'package:cityproperties/Screens/RateTheWork/Bloc/rate_bloc.dart';
import 'package:cityproperties/Screens/Register/Api/RegisterRemote.dart';
import 'package:cityproperties/Screens/Register/Bloc/register_bloc.dart';
import 'package:cityproperties/Screens/Setting/Api/ChangePasswordRemote.dart';
import 'package:cityproperties/Screens/Setting/Api/ProfileRemote.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_bloc.dart';
import 'package:cityproperties/Screens/Vacant/Api/VacantUnitRemote.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'Screens/DashBoardPage/Pages/DuePayment/Api/DuePaymentDaysRemote.dart';
import 'Screens/DashBoardPage/Pages/TenantStatement/Api/TenantStateRemote.dart';
import 'Screens/ForgetPassword/Api/ForgetPasswordRemote.dart';
import 'Screens/ForgetPassword/Bloc/forget_bloc.dart';
import 'Screens/NewComplaint/Bloc/complaint_bloc.dart';

final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  //!External

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 12000,
          receiveTimeout: 12000,
          sendTimeout: 12000,
          baseUrl: AppConstants.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            requestBody: true,
            responseHeader: true,
            requestHeader: true,
            request: true,
            error: true),
      );

      return dio;
    },
  );

  sl.registerLazySingleton(() => DataConnectionChecker());

  //datasource
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ForgetPasswordRemoteDataSource>(
    () => ForgetPasswordRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<AnnouncementRemoteDataSource>(
    () => AnnouncementRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<TenantStatementRemoteDataSource>(
    () => TenantStatementRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<DuePaymentDataSource>(
    () => DuePaymentDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<DuePaymentImageDataSource>(
    () => DuePaymentImageDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ChequeReturnDataSource>(
    () => ChequeReturnDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MonthlyPaymentDataSource>(
    () => MonthlyPaymentDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<NotificationDataSource>(
    () => NotificationDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<MyRentalsDataSource>(
    () => MyRentalsDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MyRentalsDetailsDataSource>(
    () => MyRentalsDetailsDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<VacantUnitDataSource>(
    () => VacantUnitDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<ChangePasswordRemoteDataSource>(
    () => ChangePasswordRemoteDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<MaintenanceHistoryDataSource>(
    () => MaintenanceHistoryDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<TechDetailsDataSource>(
    () => TechDetailsDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<JobMaterialDataSource>(
    () => JobMaterialDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<MyRateDataSource>(
    () => MyRateDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<RateJobDataSource>(
    () => RateJobDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<JobDetailsDataSource>(
    () => JobDetailsDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ServiceTypeDataSource>(
    () => ServiceTypeDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<SpotUnitDataSource>(
    () => SpotUnitDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ComplainDataSource>(
    () => ComplainDataSourceImpl(dio: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<NewComplainDataSource>(
    () => NewComplainDataSourceImpl(dio: sl(), networkInfo: sl()),
  );

  // Bloc
  sl.registerLazySingleton(() => LoginBloc(loginRemoteDataSource: sl()));

  sl.registerLazySingleton(
      () => ForgetBloc(forgetPasswordRemoteDataSource: sl()));

  sl.registerLazySingleton(() => RegisterBloc(registerRemoteDataSource: sl()));
  sl.registerLazySingleton(() => DashboardBloc(
      announcementRemoteDataSource: sl(),
      tenantStatementRemoteDataSource: sl(),
      duePaymentDataSource: sl(),
      duePaymentImageDataSource: sl(),
      chequeReturnDataSource: sl(),
      monthlyPaymentDataSource: sl()));

  sl.registerLazySingleton(
      () => NotificationBloc(notificationDataSource: sl()));

  sl.registerLazySingleton(() => HomeBloc());

  sl.registerLazySingleton(() => MyRentalsBloc(
      myRentalsDataSource: sl(),
      myRentalsDetailsDataSource: sl(),
      vacantUnitDataSource: sl()));

  sl.registerLazySingleton(() => SettingBloc(
      profileRemoteDataSource: sl(),
      changePasswordRemoteDataSource: sl(),
      loginRemoteDataSource: sl()));

  sl.registerLazySingleton(() => MaintenanceBloc(
      maintenanceHistoryDataSource: sl(),
      techDetailsDataSource: sl(),
      jobMaterialDataSource: sl(),
      jobDetailsDataSource: sl()));

  sl.registerLazySingleton(
      () => RateBloc(myRateDataSource: sl(), rateJobDataSource: sl()));

  sl.registerLazySingleton(() => ComplaintBloc(
      myRentalsDataSource: sl(),
      serviceTypeDataSource: sl(),
      spotUnitDataSource: sl(),
      complainDataSource: sl(),
      newComplainDataSource: sl()));
}
