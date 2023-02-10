
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobDetailsModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ComplaintData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ServiceTypeModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class ComplainDataSource {
  Future<Either<String, ComplaintData>> getComplainData(
  {
    required String propertyCode,
    required String serviceTypeId,
    required String spotId,
  });
}

class  ComplainDataSourceImpl extends ComplainDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  ComplainDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, ComplaintData>> getComplainData(
      {
        required String propertyCode,
        required String serviceTypeId,
        required String spotId,
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {

        final re = await dio.post(
          AppConstants.getComplaint,
          queryParameters: {
            'propertycode': propertyCode,
            'servicetype' : serviceTypeId,
            'spotid':spotId
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(ComplaintData.fromJson(json.decode(re.data)));
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
