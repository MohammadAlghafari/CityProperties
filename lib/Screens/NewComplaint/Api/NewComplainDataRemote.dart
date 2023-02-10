
import 'dart:collection';
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobDetailsModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ComplaintData.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ResultModel.dart';
import 'package:cityproperties/Screens/NewComplaint/Model/ServiceTypeModel.dart';

import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class NewComplainDataSource {
  Future<Either<String, ResultData>> newComplain(
  {
    required Map<String, Object> complaintData
  });
}

class  NewComplainDataSourceImpl extends NewComplainDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  NewComplainDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, ResultData>> newComplain(
      {
        required Map<String, Object> complaintData
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        Map<String, List> data = HashMap();
        data["createkcm"] =[complaintData];

        final re = await dio.post(
          AppConstants.newComplaint,
          data:data,
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(ResultData.fromJson(json.decode(re.data)));
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
