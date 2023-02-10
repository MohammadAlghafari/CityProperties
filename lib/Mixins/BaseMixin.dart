import 'dart:io';


import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants/AppConstants.dart';
import '../Helper/FirebaseNotificationService.dart';



mixin BaseMixin {
  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(value,
        style: TextStyle(
          fontSize: 14.sp
        ),
        ),
        // duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String msg,
    String? positiveBtn,
    String? negativeBtn,
    VoidCallback? positivePressed,
    VoidCallback? negativePressed,
    bool cancelable:true
  }) async {
    Platform.isAndroid
        ? showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => cancelable,
                child: AlertDialog(
                  title: Center(child: Text(title,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700
                  ),
                  )),
                  content: Text(msg,
                    style: TextStyle(
                        fontSize: 14.sp
                    ),
                  ),
                  actions: negativeBtn != null
                      ? <Widget>[
                          TextButton(
                              onPressed: negativePressed,
                              child: Text(negativeBtn,style: TextStyle(
                                fontSize: 14.sp
                              ),)),
                          TextButton(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? LocaleKeys.lbl_ok.tr(),
                               style: TextStyle(fontSize: 14.sp),
                              ))
                        ]
                      : <Widget>[
                          TextButton(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? LocaleKeys.lbl_ok.tr(),
                              style: TextStyle(fontSize: 14.sp),
                              ))
                        ],
                ),
              );
            },
          )
        : showCupertinoDialog(
            context: context,
            builder: (_) {
              return WillPopScope(
                onWillPop: () async => cancelable,
                child: CupertinoAlertDialog(
                  title: Text(title),
                  content: Text(msg),
                  actions: negativeBtn != null
                      ? <Widget>[
                          CupertinoDialogAction(
                              onPressed: negativePressed,
                              child: Text(negativeBtn,
                               style: TextStyle(
                                   fontSize: 14.sp
                               ),
                              )),
                          CupertinoDialogAction(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? LocaleKeys.lbl_ok.tr(),
                                style: TextStyle(
                                    fontSize: 14.sp
                                ),
                              ))
                        ]
                      : <Widget>[
                          CupertinoDialogAction(
                              onPressed: positivePressed,
                              child: Text(positiveBtn ?? LocaleKeys.lbl_ok.tr(),
                                style: TextStyle(
                                    fontSize: 14.sp
                                ),
                              ))
                        ],
                ),
              );
            });
  }

  void showLoadingDialog(BuildContext context) async {
    // SharedPreferences prefs = await  SharedPreferences.getInstance();
    // prefs.setBool(KeyConstants.keyLoading, true);
    // show the loading dialog
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              // The background color

              backgroundColor: Colors.white,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // The loading indicator
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Some text
                    Text(LocaleKeys.ttl_loading.tr(),
                      style: TextStyle(
                          fontSize: 14.sp
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void hideLoadingDialog(BuildContext context) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // bool loading = pref.getBool(KeyConstants.keyLoading)??false;
    // if(loading){
    Navigator.of(context).pop();
    // }
    // pref.remove(KeyConstants.keyLoading);
  }

  String getFormattedNumber(var number, BuildContext context) {
    number = double.parse(number.toString());
    var formatter = NumberFormat.decimalPattern("en_US");
    String num = convertYear2Ar(formatter.format(number), context);
    return num;
  }

  Future<String> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString(KeyConstants.keyUserId).toString();
    return userId;
  }

  Future<void> changeLanguage(BuildContext context) async {
    if (Localizations.localeOf(context).languageCode == 'en') {
      await context.setLocale(Locale('ar'));
    } else {
      await context.setLocale(Locale('en'));
    }
  }

  bool isArabic(BuildContext context) {
    return (Localizations.localeOf(context).languageCode == 'ar');
  }

  List<String> splitYearMonth(BuildContext context, String date, bool short) {
    String dateWith = date.substring(0, 4) + '-' + date.substring(4);

    print(dateWith);

//   DateTime dateTime = DateTime.parse(dateWith);

    DateTime tempDate = DateFormat("yyyy-MM").parse(dateWith);
    print(tempDate);

    String formattedDate;
    if (short) {
      formattedDate = DateFormat('yyyy-MMM').format(tempDate);
    } else {
      formattedDate = DateFormat('yyyy-MMMM').format(tempDate);
    }

    List<String> yearMonth = formattedDate.split('-');

    return [
      convertYear2Ar(yearMonth[0], context),
      getMonthName(yearMonth[1], context)
    ];
  }

  String getFormattedDate(String date, {String? inputFormat, outputFormat}) {
    if (date == "") {
      return "";
    }
    outputFormat ??= 'MMM-dd, yyyy';
    inputFormat ??= "yyyy-MM-dd HH:mm:ss.S";
    DateTime tempDate = DateFormat(inputFormat,'en').parse(date);
    String formattedDate = DateFormat(outputFormat,'en').format(tempDate);

    return formattedDate;
  }

  String getMonthName(String str, BuildContext context) {
    bool isAr = isArabic(context);
    if (!isAr) {
      return str;
    }
    str = str.toLowerCase();

    if (str.contains("jan")) {
      return "يناير";
    } else if (str.contains("feb")) {
      return "فبراير";
    } else if (str.contains("mar")) {
      return "مارس";
    } else if (str.contains("apr")) {
      return "إبريل";
    } else if (str.contains("may")) {
      return "مايو";
    } else if (str.contains("jun")) {
      return "يونيو";
    } else if (str.contains("jul")) {
      return "يوليو";
    } else if (str.contains("aug")) {
      return "أغسطس";
    } else if (str.contains("sep")) {
      return "سبتمبر";
    } else if (str.contains("oct")) {
      return "أكتوبر";
    } else if (str.contains("nov")) {
      return "نوفمبر";
    } else if (str.contains("dec")) {
      return "ديسمبر";
    }
    return str;
  }

  String convertYear2Ar(String input, BuildContext context) {
    if (isArabic(context)) {
      input = input
          .replaceAll("1", "١")
          .replaceAll("2", "٢")
          .replaceAll("3", "٣")
          .replaceAll("4", "٤")
          .replaceAll("5", "٥")
          .replaceAll("6", "٦")
          .replaceAll("7", "٧")
          .replaceAll("8", "٨")
          .replaceAll("9", "٩")
          .replaceAll("0", "٠");
    }

    return input;
  }

  String getImageUrl(String url) {
    if (url == null) {
      return "";
    } else if (url.contains("E:\\\\REMS")) {
      url = url.replaceAll("E:\\\\REMS", AppConstants.serverUrlImages);
      url = url.replaceAll("\\", "/");
    } else if (url.contains("E:\\REMS")) {
      url = url.replaceAll("E:\\REMS", AppConstants.serverUrlImages);
      url = url.replaceAll("\\", "/");
    } else if (url.contains("X:")) {
      url = url.replaceAll("X:", AppConstants.serverUrlImages);
      url = url.replaceAll("\\", "/");
    }

    url = url.replaceAll(" ", "%20");
    return url;
  }

  String getTypeIcon(String title) {
    if (title.toLowerCase().contains("air conditioning")) {
      return 'assets/ic_acicon.png';
    } else if (title.toLowerCase().contains("bathtub")) {
      return 'assets/ic_bathtub.png';
    } else if (title.toLowerCase().contains("carpentry")) {
      return 'assets/ic_carpentry.png';
    } else if (title.toLowerCase().contains("electricity")) {
      return 'assets/ic_electricity.png';
    } else if (title.toLowerCase().contains("plumbing")) {
      return 'assets/ic_plumbing.png';
    } else if (title.toLowerCase().contains("ceramic")) {
      return 'assets/ic_ceramic.png';
    } else if (title.toLowerCase().contains("pest control")) {
      return 'assets/ic_pest.png';
    } else if (title.toLowerCase().contains("painting")) {
      return 'assets/ic_painting.png';
    } else {
      return 'assets/ic_maintainic.png';
    }
  }

   String setStatusImage (String title){
    if (title.toLowerCase().contains("completed")){
      return 'assets/status_completed.png';

    }else if (title.toLowerCase().contains("received")){
      return 'assets/status_received.png';

    }else if (title.toLowerCase().contains("wip")){
      return 'assets/status_wip.png';

    }else if (title.toLowerCase().contains("in progress")){
      return 'assets/status_wip.png';

    }else if (title.toLowerCase().contains("assigned")){
      return 'assets/status_assigned.png';

    }else if (title.toLowerCase().contains("cancelled")){
      return 'assets/status_cancel.png';

    }else{
      return 'assets/status_wip.png';

    }
  }

  void setUpNotification(BuildContext context) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((value) {
    //   print('firebase token =$value');
    //   //sendTokenToServer(value);
    //   Pref.setFcmToken(token: '$value');
    // });
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString(KeyConstants.keyUserId) ?? "";

    messaging.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        int notiCount = pref.getInt(KeyConstants.keyNotiCount) ?? 0;
        pref.setInt(KeyConstants.keyNotiCount, notiCount++);
        if (message != null && userId.isNotEmpty) {
          print("New Notification");
          Navigator.pushNamed(context, '/notifications');
          // }
        }
      },
    );

    // 2. This method only call when App in foreground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          FirebaseNotificationService.display(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          // print("message.data22 ${message.data['_id']}");
        }
      },
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }



  Future<void> startUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isAndroid) {
      launch("https://play.google.com/store/apps/details?id=" +
          packageInfo.packageName);
    } else {
      launch(
          "itms-apps://itunes.apple.com/us/app/apple-store/id1344414289?mt=8");
    }
  }

  int getExtendedVersionNumber(String version) {
    List versionCells = version.split('.');
    versionCells = versionCells.map((i) => int.parse(i)).toList();
    return versionCells[0] * 100000 + versionCells[1] * 1000 + versionCells[2];
  }
}
