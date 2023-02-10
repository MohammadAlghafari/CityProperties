
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobDetailsModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class JobDetailsDataSource {
  Future<Either<String, JobDetailsModel>> getJobDetails(
  {
    required String jobNo
  });
}

class  JobDetailsDataSourceImpl extends JobDetailsDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  JobDetailsDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, JobDetailsModel>> getJobDetails(
      {
        required String jobNo
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {

        final re = await dio.post(
          AppConstants.jobDetails,
          queryParameters: {
            "jobno":jobNo
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(JobDetailsModel.fromJson(json.decode(re.data)));
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
