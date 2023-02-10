import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/CustomWidgets/TextFormFieldWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/ForgetPassword/Bloc/forget_bloc.dart';
import 'package:cityproperties/Screens/ForgetPassword/Bloc/forget_state.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher_string.dart';


class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with BaseMixin {

 late ForgetBloc bloc;


  final emailController = TextEditingController();
  final emiratIdController = TextEditingController();


  @override
  void initState() {
    bloc = sl<ForgetBloc>();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emiratIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetBloc, ForgetState>(
      bloc: bloc,
      listener: (context, state) {
        if(state.error!.isNotEmpty){
          showInSnackBar(context, state.error!,
          );
        }
        else if (state.isSuccess!){
          showAlertDialog(context: context,
          msg: LocaleKeys.lbl_forget_pass_success_1.tr(), title: LocaleKeys.ttl_success.tr(),
            positivePressed: (){
             Navigator.pop(context);
             Navigator.pop(context);
            }
          );
        }

      },
      builder: (context, state) {
        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: state.isLoading!,

            child: Scaffold(
              appBar: AppBar(

                title: Text(LocaleKeys.lbl_forget_password.tr(),
                  style: TextStyle(
                      fontSize: 17.sp
                  ),
                ),

              ),
              body: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Column(
                    children: <Widget>[

                      SizedBox(height: 60.h),
                      TextFormFieldWidget(
                        hintText: LocaleKeys.lbl_enter_reg_email.tr(),
                        controller: emailController,
                        isDense: true,


                        focusBorderColor: MyColors.colorPrimary,
                      ),
                      TextFormFieldWidget(
                        hintText: LocaleKeys.lbl_enter_reg_emp_id.tr(),
                        controller: emiratIdController,
                        textInputType: TextInputType.number,
                        isDense: true,
                        focusBorderColor: MyColors.colorPrimary,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButtonWidget(
                          onPressed: () {
                            //  userName = emailController.text.trim();
                            //  password = emiratIdController.text;
                            if(emailController.text.trim().isNotEmpty&&emiratIdController.text.trim().isNotEmpty)
                              {
                                bloc.add(ForgetEventSubmit(
                                  email:   emailController.text.trim(),
                                  emiratesId: emiratIdController.text.trim(),

                                ));
                              }
                            else{
                            showInSnackBar(context, LocaleKeys.msg_fill_all_field.tr(),
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
                          // _bloc.add(LoginEventCall(number: 'tel://+97165114000'));
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