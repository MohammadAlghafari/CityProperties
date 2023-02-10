
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/CustomWidgets/TextFormFieldWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/ForgetPassword/ForgetPasswordPage.dart';
import 'package:cityproperties/Screens/HomePage/HomePage.dart';
import 'package:cityproperties/Screens/Login/Bloc/login_bloc.dart';
import 'package:cityproperties/Screens/Login/Bloc/login_state.dart';
import 'package:cityproperties/Screens/Register/RegisterPage.dart';

import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../injection.dart';



class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseMixin {
  late FirebaseMessaging messaging;
  late LoginBloc bloc;

  final userController = TextEditingController();
  final pwdController = TextEditingController();

  String userName = '';
  String password = '';

  bool _obscured = true;

  @override
  void initState() {
    // TODO: implement initState
    bloc = sl<LoginBloc>();
    print('init');

    super.initState();


  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) async {
        // TODO: implement listener

        if (state.isSuccess!) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else if (state.error!.isNotEmpty) {
          showInSnackBar(context, state.error!,
          );
        }
        // else if ( state is LoginLanguageState){
        //
        //    changeLanguage(context);
        // }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(

            title: Text(LocaleKeys.ttl_login.tr(),
              style: TextStyle(
                  fontSize: 17.sp
              ),
            ),
            actions: [
              IconButton(
                icon: isArabic(context) ? Image.asset('assets/icon_uk.png')
                    :Image.asset('assets/icon_uae.png'),
                onPressed: () async {
                  changeLanguage(context);
                 // bloc.add(LoginEventLanguage());
                },
              ),
            ],
          ),
          body: BlocBuilder<LoginBloc, LoginState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.isLoading! ) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/cplogo.png',
                          height: 200.h,
                        ),
                        SizedBox(height: 20.h),
                        TextFormFieldWidget(
                          hintText: LocaleKeys.ttl_username.tr(),
                          controller: userController,
                          isDense: true,
                          focusBorderColor: MyColors.colorPrimary,

                        ),
                        TextFormFieldWidget(
                          hintText: LocaleKeys.ttl_password.tr(),
                          isPassword: _obscured,
                          toggleObscured: _toggleObscured,
                          suffix: true,
                          controller: pwdController,
                          focusBorderColor: MyColors.colorPrimary,
                          isDense: true,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButtonWidget(
                            onPressed: () {
                              if(userController.text.isNotEmpty&&pwdController.text.isNotEmpty) {
                                userName = userController.text.trim();
                                password = pwdController.text;

                                bloc.add(LoginEventSubmit(
                                    username: userName,
                                    password: password));
                              }
                              else{
                                showInSnackBar(context, LocaleKeys.msg_fill_all_field.tr(),
                                );
                              }

                            },
                            text: LocaleKeys.ttl_login.tr(),
                            bgColor: MyColors.colorPrimary,
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  const ForgetPasswordPage(),));
                                },
                                child: Text(LocaleKeys.lbl_forget_password.tr(),style: TextStyle(
                                    fontSize: 14.sp,
                                    color: MyColors.white
                                ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              child: VerticalDivider(
                                color: MyColors.white,
                                thickness: 1.5.w,

                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                  const RegisterPage(),));
                                },
                                child: Text(LocaleKeys.lbl_register_now.tr(),style: TextStyle(
                                    fontSize: 14.sp,
                                    color: MyColors.white
                                ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        IconButton(
                          onPressed: () {
                            launchUrlString(AppConstants.callUs);
                           // bloc.add(LoginEventCall(number: 'tel://+97165114000'));
                          },
                          icon: Image.asset('assets/callus.png'),
                          iconSize: 50.sp,
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

}