
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/MyRateModel.dart';
import 'package:cityproperties/Screens/RateTheWork/Model/RateJobModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class RateJobDataSource {
  Future<Either<String, RateJobModel>> rateJob(
      {
        required String jobNo,
        required String comments,
        required String userratings,
      }
      );
}

class  RateJobDataSourceImpl extends RateJobDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  RateJobDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, RateJobModel>> rateJob({
     required String jobNo,
    required String comments,
    required String userratings,

    }) async {
    if (await networkInfo.hasConnection) {
      try {

        //jobno for test 163987
        final re = await dio.post(
          AppConstants.jobRate,
          queryParameters: {
            "jobnumber":jobNo,
            "rating":"0",
            "userratings":userratings,
            "comments":comments

          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(RateJobModel.fromJson(json.decode(re.data)));
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
