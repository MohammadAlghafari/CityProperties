import 'dart:io';
import 'dart:math';

import 'package:app_review/app_review.dart';
import 'package:cityproperties/Constants/KeyConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Screens/Login/LoginPage.dart';
import 'package:cityproperties/Screens/Notifications/NotificationsPage.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_bloc.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_state.dart';
import 'package:cityproperties/Screens/Setting/Widget/CustomViews/ProfileHeaderView.dart';
import 'package:cityproperties/Screens/Setting/Widget/CustomViews/SettingSubView.dart';

import 'package:cityproperties/WebView/WebViewer.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Mixins/BaseMixin.dart';
import 'ContactUsPage.dart';
import 'CopyrightsPage.dart';

import 'ProfilePage.dart';

class SettingPage extends StatefulWidget {
  final SettingBloc settingBloc;

  const SettingPage({super.key, required this.settingBloc});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with BaseMixin, AutomaticKeepAliveClientMixin {
//  late LandlordProfile profile;

  // late SettingsBloc _bloc;

  bool updateAvailable = false;

  @override
  void initState() {
    widget.settingBloc.add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<SettingBloc, SettingState>(
      bloc: widget.settingBloc,
      listener: (context, state) {
        if (state.logOutModel!.listLogin != null &&
            state.logOutModel!.listLogin!.isNotEmpty) {
          _logout();
        }
        else if (state.error!.isNotEmpty)
          {
            showInSnackBar(context, state.error!);
          }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state.isLoading!,
            child: Scaffold(
              backgroundColor: MyColors.liteWhite,
              appBar: AppBar(
                title: Text(
                  LocaleKeys.tab_settings.tr(),
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              body: RefreshIndicator(
                onRefresh: () async {
                  widget.settingBloc.add(GetProfileEvent());
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(),
                    child:
                         Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              if(state.profileModel!.listProfileModel != null &&
                                  state.profileModel!.listProfileModel!.isNotEmpty)
                                ...[
                                  Visibility(
                                    visible: state.profileModel!
                                        .listProfileModel![0].tENANTNAME !=
                                        null,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ProfilePage(
                                                  profile: state.profileModel!
                                                      .listProfileModel![0],
                                                  settingBloc:
                                                  widget.settingBloc,
                                                )));
                                      },
                                      child: ProfileHeaderView(
                                        name: state.profileModel!
                                            .listProfileModel![0].tENANTNAME,
                                        email: state.profileModel!
                                            .listProfileModel![0].eMAIL,
                                        number: state.profileModel!
                                            .listProfileModel![0].mOBILE,
                                        image: state.profileModel!
                                            .listProfileModel![0].pHOTO,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _showAlert();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                          foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(8.w)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(0),
                                              ))),
                                      child: Text(
                                        LocaleKeys.btn_logout.tr(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],


                              SettingSubView(
                                text: LocaleKeys.settings_contactus.tr(),
                                icon: ("assets/ic_contact_us.png"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ContactUsPage()));
                                },
                              ),
                              SettingSubView(
                                text: LocaleKeys.settings_aboutus.tr(),
                                icon: ("assets/ic_about_us.png"),
                                onTap: () {
                                  String url = isArabic(context)
                                      ? "https://www.propertiesre.com/ar/aboutus/company-profile.aspx"
                                      : "https://www.propertiesre.com/en/aboutus/company-profile.aspx";
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WebViewer(url: url)));
                                },
                              ),
                              SettingSubView(
                                text: LocaleKeys.settings_checkupdate.tr(),
                                icon: ("assets/ic_check_update.png"),
                                onTap: () async {
                                  showInSnackBar(context,
                                      LocaleKeys.ttl_last_version.tr());
                                },
                              ),
                              SettingSubView(
                                text: LocaleKeys.ttl_select_language.tr(),
                                icon: ("assets/ic_language.png"),
                                onTap: () async {
                                  showLanguageDialog();
                                },
                              ),
                              SettingSubView(
                                text: LocaleKeys.ttl_notifications.tr(),
                                icon: ("assets/notificationicon.png"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) =>
                                        const NotificationsPage(),
                                        transitionsBuilder:
                                            (context, animation, secondaryAnimation, child) {
                                          final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
                                          return AnimatedBuilder(
                                            animation: rotateAnim,
                                            child: child,
                                            builder: (context, widget) {
                                              final value =  min(rotateAnim.value, pi / 2) ;
                                              return Transform(
                                                transform: Matrix4.rotationY(value),
                                                child: widget,
                                                alignment: Alignment.center,
                                              );
                                            },
                                          );
                                        },
                                        transitionDuration: const Duration(milliseconds: 700),
                                      ));
                                },
                              ),
                              SettingSubView(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CopyrightsPage()));
                                },
                                text: LocaleKeys.settings_Credits.tr(),
                                icon: ("assets/ic_copyrights.png"),
                              ),
                              SettingSubView(
                                text: LocaleKeys.settings_rate.tr(),
                                icon: ("assets/ic_rate_now.png"),
                                onTap: () async {
                                  if (Platform.isIOS) {
                                    AppReview.openAppStore();
                                  } else {
                                    AppReview.openGooglePlay();
                                  }
                                },
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    child: FutureBuilder(
                                        future: _getVersion(),
                                        initialData: "Version: ",
                                        builder: (BuildContext context,
                                            AsyncSnapshot<String> text) {
                                          return Text(
                                            "v ${text.data!}",
                                            style: TextStyle(
                                                fontSize: 13.5.sp,
                                                fontWeight: FontWeight.w500),
                                          );
                                        }),
                                  )),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Future<void> _logout() async {
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  void _showAlert() {
    showAlertDialog(
        context: context,
        title: LocaleKeys.ttl_exit.tr(),
        msg: LocaleKeys.ttl_are_you_sure_signout.tr(),
        positiveBtn: LocaleKeys.ttl_yes.tr(),
        negativeBtn: LocaleKeys.ttl_no.tr(),
        positivePressed: () {
          //  _bloc.add(SettingsEventLogout());
          widget.settingBloc.add(LogOutEvent());

          Navigator.pop(context);
        },
        negativePressed: () {
          Navigator.pop(context);
        });
  }

  Future<String> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;

    return version;
  }

  void showLanguageDialog() async {
    // show the loading dialog
    Platform.isAndroid
        ? showDialog<void>(
            // The user CANNOT close this dialog  by pressing outsite it
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(
                    child: Text(
                  LocaleKeys.ttl_select_language.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                )),
                actions: <Widget>[
                  TextButton(
                      child: Text(
                        "العربية",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onPressed: () async {
                        if (Localizations.localeOf(context).languageCode ==
                            'en') {
                          Navigator.of(context).pop();

                          await context.setLocale(Locale('ar'));
                        } else {
                          Navigator.of(context).pop();
                        }
                      }),
                  TextButton(
                      child: Text(
                        "English",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      onPressed: () async {
                        if (Localizations.localeOf(context).languageCode ==
                            'ar') {
                          Navigator.of(context).pop();
                          await context.setLocale(Locale('en'));
                        } else {
                          Navigator.of(context).pop();
                        }
                      })
                ],
              );
            })
        : showCupertinoDialog(
            barrierDismissible: true,
            context: context,
            builder: (_) {
              return CupertinoAlertDialog(
                title: Text(LocaleKeys.ttl_select_language.tr()),
                actions: [
                  CupertinoDialogAction(
                      child: const Text("العربية"),
                      onPressed: () async {
                        if (Localizations.localeOf(context).languageCode ==
                            'en') {
                          Navigator.of(context).pop();

                          await context.setLocale(Locale('ar'));
                        } else {
                          Navigator.of(context).pop();
                        }
                      }),
                  CupertinoDialogAction(
                      child: const Text("English"),
                      onPressed: () async {
                        if (Localizations.localeOf(context).languageCode ==
                            'ar') {
                          Navigator.of(context).pop();
                          await context.setLocale(const Locale('en'));
                        } else {
                          Navigator.of(context).pop();
                        }
                      }),
                ],
              );
            });
  }

  @override
  bool get wantKeepAlive => true;
}
