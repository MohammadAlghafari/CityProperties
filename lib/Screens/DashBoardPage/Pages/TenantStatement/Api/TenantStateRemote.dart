import 'dart:convert';
import 'dart:io';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/Announcement/Model/AnnouncementModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/TenantStatement/Model/TenantStateModel.dart';

import 'package:cityproperties/Screens/ForgetPassword/Model/ForgetPasswordModel.dart';
import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/Screens/Register/Model/RegisterModel.dart';
import 'package:cityproperties/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';




abstract class TenantStatementRemoteDataSource {
  Future<Either<String, TenantStateModel>> getTenantStatement(
      );
}

class TenantStatementRemoteDataSourceImpl extends TenantStatementRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  TenantStatementRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, TenantStateModel>> getTenantStatement(
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        String? pidNo =Preferences.preferences!.getString(KeyConstants.keyPidNo);
        final re = await dio.post(
          AppConstants.tenantStatement,
          queryParameters: {
            "pidno":pidNo
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(TenantStateModel.fromJson(json.decode(re.data)));
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
