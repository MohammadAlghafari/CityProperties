
import 'dart:convert';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/ChequeReturn/Model/ChequeReturnModel.dart';

import 'package:cityproperties/Screens/DashBoardPage/Pages/DuePayment/Model/DuePaymentModel.dart';
import 'package:cityproperties/Screens/DashBoardPage/Pages/MonthlyPayment/Model/MonthlyPaymentModel.dart';
import 'package:cityproperties/Screens/MyRentals/Model/MyRentalsModel.dart';
import 'package:cityproperties/Screens/Notifications/Model/NotificationModel.dart';


import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

import 'package:dio/dio.dart';





abstract class MyRentalsDataSource {
  Future<Either<String, MyRentalsModel>> getMyRentals(
  {required String shortCode}
      );
}

class  MyRentalsDataSourceImpl extends MyRentalsDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  MyRentalsDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, MyRentalsModel>> getMyRentals(
      {required String shortCode}
      ) async {
    if (await networkInfo.hasConnection) {
      try {
        String? pidno=Preferences.preferences!.getString(KeyConstants.keyPidNo);
        //pidno for test CP5200
        final re = await dio.post(
          AppConstants.myRental,
          queryParameters: {
            "pidno":pidno,
            "Shortcode":shortCode
          },
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
        );

        return Right(MyRentalsModel.fromJson(json.decode(re.data)));
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
