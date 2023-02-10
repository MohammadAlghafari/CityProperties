
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsDetailsModel.dart';

import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/Vacant/Model/VacantUnitModel.dart';


import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class VacantUnitDataSource {
  Future<Either<String, VacantUnitModel>> getVacantUnit({
    required String cityCode,
    required String devCode
});
}

class  VacantUnitDataSourceImpl extends VacantUnitDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  VacantUnitDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, VacantUnitModel>> getVacantUnit(
      {
        required String cityCode,
        required String devCode
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        final re = await dio.post(
          AppConstants.vacantUnit,
          queryParameters: {
            "DEVCODE":devCode,
            "CITYCODE":cityCode
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(VacantUnitModel.fromJson(json.decode(re.data)));
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
