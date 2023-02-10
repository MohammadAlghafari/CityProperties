
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Model/ChequeReturnModel.dart';

import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Model/DuePaymentModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/Model/MonthlyPaymentModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';
import 'package:cityproperties/Screens/Setting/Model/ProfileModel.dart';


import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class ProfileRemoteDataSource {
  Future<Either<String, ProfileModel>> getProfile();
}

class  ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  ProfileRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, ProfileModel>> getProfile() async {
    if (await networkInfo.hasConnection) {
      try {
        String? pidNo=Preferences.preferences!.getString(KeyConstants.keyPidNo);
        String? tenantCode=Preferences.preferences!.getString(KeyConstants.keyUserId);
        final re = await dio.post(
          AppConstants.profile,
          queryParameters: {
            "pidno":pidNo,
            "TENANTCODE":tenantCode
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(ProfileModel.fromJson(json.decode(re.data)));
      } on DioError catch (ex) {
        if (ex.type == DioErrorType.connectTimeout) {
          return Left(Er.networkError);
        } else if (ex.type == DioErrorType.receiveTimeout) {
          return Left(Er.networkError);
        }
        return Left(Er.networkError);
      } catch (e) {
        print(e);
        return Left(Er.error);
      }
    } else {
      return Left(Er.networkError);
    }
  }
}
