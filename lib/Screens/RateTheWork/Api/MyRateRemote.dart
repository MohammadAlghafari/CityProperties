
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/MyRateModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class MyRateDataSource {
  Future<Either<String, MyRateModel>> getMyRate(
      {
        required String jobNo
      }
      );
}

class  MyRateDataSourceImpl extends MyRateDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  MyRateDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, MyRateModel>> getMyRate({
     required String jobNo
    }) async {
    if (await networkInfo.hasConnection) {
      try {

        //jobno for test 163987
        final re = await dio.post(
          AppConstants.myRate,
          queryParameters: {
            "jobno":jobNo,
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(MyRateModel.fromJson(json.decode(re.data)));
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
