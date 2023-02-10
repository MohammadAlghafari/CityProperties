import 'dart:convert';
import 'dart:io';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/Login/Model/LoginModel.dart';
import 'package:cityproperties/injection.dart';
import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<String?> getId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if(Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
  return null;
}

abstract class LoginRemoteDataSource {
  Future<Either<String, LoginModel>> login({
    required String name,
    required String password,
     var userId
  });
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final Dio dio;
  final DataConnectionChecker networkInfo;

  LoginRemoteDataSourceImpl({required this.dio, required this.networkInfo});

  @override
  Future<Either<String, LoginModel>> login({
    required String name,
    required String password,
    var userId
  }) async {
    if (await networkInfo.hasConnection) {
      try {


        var deviceId = await getId();

        String deviceToken = Preferences.preferences!.getString(KeyConstants.keyUserToken)??"";

        if(deviceToken.isEmpty){
          deviceToken = await FirebaseMessaging.instance.getToken()??"";
          Preferences.preferences!.setString(KeyConstants.keyUserToken, deviceToken);
        }

        final re = await dio.post(
          AppConstants.login,
          queryParameters: {
            "username": name,
            "psw": password,
            'language_code':"",
            "device_token": deviceToken,
            "devcice_type":Platform.isAndroid?"2":"1",
            "deviceid": deviceId,
            "userid":userId
          },

        );

        return Right(LoginModel.fromJson(json.decode(re.data)));
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
