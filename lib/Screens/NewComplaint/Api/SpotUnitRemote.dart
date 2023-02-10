
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobDetailsModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/LocationData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ServiceTypeModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class SpotUnitDataSource {
  Future<Either<String, LocationData>> getSpotUnit(
  {
    required String propertyCode,
    required String serviceTypeId
  });
}

class  SpotUnitDataSourceImpl extends SpotUnitDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  SpotUnitDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, LocationData>> getSpotUnit(
      {
        required String propertyCode,
        required String serviceTypeId
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {

        final re = await dio.post(
          AppConstants.getLocations,
          queryParameters: {
            'propertycode': propertyCode,
            'servicetype' : serviceTypeId
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(LocationData.fromJson(json.decode(re.data)));
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
