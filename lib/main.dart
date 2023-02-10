import 'dart:io';

import 'package:cityproperties/Preference.dart';
import 'package:cityproperties/Screens/Notifications/NotificationsPage.dart';
import 'package:cityproperties/translations/codegen_loader.g.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:upgrader/upgrader.dart';
import 'Constants/KeyConstants.dart';
import 'CustomColors/MyColors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Helper/FirebaseNotificationService.dart';
import 'Screens/HomePage/HomePage.dart';
import 'Screens/Login/LoginPage.dart';
import 'injection.dart' as di;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
}

void main() async {
  String userId = "";
  await di.init();

  // String userId;

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();
  await Upgrader.clearSavedSettings();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseNotificationService.initialize();
  await Preferences.init();

   userId = Preferences.preferences!.getString(KeyConstants.keyUserId) ?? "";
   try{
     final fcmToken = await FirebaseMessaging.instance.getToken();
     Preferences.preferences!.setString(KeyConstants.keyUserToken, fcmToken!);
     print(fcmToken);
   }
   catch(e){
     print(e);
   }

  userId = Preferences.preferences!.getString(KeyConstants.keyUserId) ?? "";


  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'Assets/LocalizationStrings',
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        child: MyApp(
          userId: userId,
        )),
  );
}

class MyApp extends StatelessWidget {
  final String userId;

   const MyApp({Key? key,  required this.userId}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateTitle: (BuildContext context) => LocaleKeys.app_name.tr(),

             title: "City Properties",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'SFUI',
                textTheme: TextTheme(bodyText1: TextStyle(fontSize: 14.0.sp)),
                primarySwatch: MyColors.primaryTheme,
                scaffoldBackgroundColor: MyColors.colorBGBrown),
            routes:  {
              '/notifications': (BuildContext context) =>
                      const NotificationsPage(),
            },
            home: UpgradeAlert(
              upgrader: Upgrader(
                //countryCode:isArabic(context)?"ar":"en",
                  showIgnore: false,
                  showLater: false,
                  canDismissDialog: false,

                  dialogStyle: Platform.isAndroid
                      ? UpgradeDialogStyle.material
                      : UpgradeDialogStyle.cupertino),
              child: userId.isNotEmpty ? const HomePage() : LoginPage(),
            ));
      },

    );
  }
}
