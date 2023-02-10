
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/CustomWidgets/TextFormFieldWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/Register/Bloc/register_bloc.dart';
import 'package:cityproperties/Screens/Register/Bloc/register_state.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher_string.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with BaseMixin {


  late RegisterBloc bloc;
  final userNameController = TextEditingController();
  final emiratIdController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordIdController = TextEditingController();


  bool _obscured = true;

  @override
  void initState() {
    bloc=sl<RegisterBloc>();
    super.initState();

  }

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emiratIdController.dispose();
    passwordController.dispose();
    rePasswordIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if(state.error!.isNotEmpty){
          showInSnackBar(context, state.error!,
          );
        }
        else if (state.isSuccess!){
          showAlertDialog(context: context,
              msg: LocaleKeys.msg_register_successfully.tr(), title: LocaleKeys.ttl_success.tr(),
              positivePressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoading!,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(

                title: Text(LocaleKeys.lbl_register_now.tr(),
                  style: TextStyle(
                      fontSize: 17.sp
                  ),
                ),

              ),
              body:  SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 60.h),

                      TextFormFieldWidget(
                        hintText: LocaleKeys.lbl_enter_reg_emp_id.tr(),
                        controller: emiratIdController,
                        textInputType: TextInputType.number,
                        isDense: true,
                        maxLength: 15,


                        focusBorderColor: MyColors.colorPrimary,

                      ),
                      SizedBox(height: 7.h,),
                      TextFormFieldWidget(
                        hintText: LocaleKeys.ttl_username.tr(),
                        controller: userNameController,
                        isDense: true,
                        focusBorderColor: MyColors.colorPrimary,
                      ),
                      SizedBox(height: 7.h,),
                      TextFormFieldWidget(
                        hintText: LocaleKeys.ttl_password.tr(),
                        isPassword: _obscured,
                        toggleObscured: _toggleObscured,
                        suffix: true,
                        controller: passwordController,
                        focusBorderColor: MyColors.colorPrimary,
                        isDense: true,
                      ),
                      SizedBox(height: 7.h,),
                      TextFormFieldWidget(
                        hintText: LocaleKeys.ttl_re_new_password.tr(),
                        isPassword: _obscured,
                        toggleObscured: _toggleObscured,
                        suffix: true,
                        controller: rePasswordIdController,
                        focusBorderColor: MyColors.colorPrimary,
                        isDense: true,
                      ),
                      SizedBox(height: 7.h,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButtonWidget(
                          onPressed: () {
                            //   userName = emailController.text.trim();
                            //  password = emiratIdController.text;

                            if(passwordController.text.trim().isEmpty||
                                rePasswordIdController.text.trim().isEmpty||
                                userNameController.text.trim().isEmpty||
                                emiratIdController.text.trim().isEmpty

                            ){
                              showInSnackBar(context, LocaleKeys.msg_fill_all_field.tr());
                            }
                            else  if( passwordController.text.length<5)
                            {
                              showInSnackBar(context, LocaleKeys.msg_min_pass_length.tr());
                            }
                            else  if( passwordController.text!=rePasswordIdController.text)
                            {
                              showInSnackBar(context, LocaleKeys.msg_new_pass_not_matched.tr());
                            }
                            else  if( emiratIdController.text.trim().length!=15)
                            {
                              showInSnackBar(context, LocaleKeys.lbl_enter_valid_emirates_id.tr());
                            }
                            else{
                              bloc.add(RegisterEventSubmit(
                                  pwd: passwordController.text,
                                  emiratesId: emiratIdController.text.trim(),
                                  userName: userNameController.text.trim()
                              )
                              );
                            }


                          },
                          text: LocaleKeys.ttl_submit.tr(),
                          bgColor: MyColors.colorPrimary,
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 40.h),

                      SizedBox(height: 30.h),
                      IconButton(
                        onPressed: () {
                          launchUrlString(AppConstants.callUs);
                        },
                        icon: Image.asset('assets/callus.png'),
                        iconSize: 50.sp,
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}