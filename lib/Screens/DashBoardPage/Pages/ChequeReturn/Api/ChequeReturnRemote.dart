import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Model/ChequeReturnModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class ChequeReturnDataSource {
  Future<Either<String, ChequeReturnModel>> getChequeReturn();
}

class  ChequeReturnDataSourceImpl extends ChequeReturnDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  ChequeReturnDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, ChequeReturnModel>> getChequeReturn() async {
    if (await networkInfo.hasConnection) {
      try {
        String? tenantCode =Preferences.preferences!.getString(KeyConstants.keyUserId);
        //tenantCode for test 11417
        final re = await dio.post(
          AppConstants.chequeReturn,
          queryParameters: {
            "tenantcode":tenantCode
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(ChequeReturnModel.fromJson(json.decode(re.data)));
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
