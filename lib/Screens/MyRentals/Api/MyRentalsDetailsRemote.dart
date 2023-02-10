
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsDetailsModel.dart';

import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';


import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class MyRentalsDetailsDataSource {
  Future<Either<String, MyRentalsDetailsModel>> getMyRentalsDetails({
   required String propertyCode
});
}

class  MyRentalsDetailsDataSourceImpl extends MyRentalsDetailsDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  MyRentalsDetailsDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, MyRentalsDetailsModel>> getMyRentalsDetails(
      {
        required String propertyCode
      }
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        String? pidno=Preferences.preferences!.getString(KeyConstants.keyPidNo);
        //pidno for test CP5088
        //propertycode for test 4182644
        final re = await dio.post(
          AppConstants.myRentalDetails,
          queryParameters: {
            "pidno":pidno,
            "propertycode":propertyCode
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(MyRentalsDetailsModel.fromJson(json.decode(re.data)));
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
