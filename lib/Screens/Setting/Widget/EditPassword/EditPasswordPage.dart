import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/CustomWidgets/TextFormFieldWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_bloc.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_state.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditPasswordPage extends StatefulWidget {
  final SettingBloc settingBloc;

  const EditPasswordPage({Key? key, required this.settingBloc})
      : super(key: key);

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> with BaseMixin {
  bool _obscuredOld = true, _obscuredNew = true, _obscuredRe = true;

  final oldPwdController = TextEditingController();
  final newPwdController = TextEditingController();
  final rePwdController = TextEditingController();

  // late PasswordBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    // _bloc = PasswordBloc();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    oldPwdController.dispose();
    newPwdController.dispose();
    rePwdController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingBloc, SettingState>(
      bloc: widget.settingBloc,
      listener: (context, state) {
        if(state.error!.isNotEmpty){
          showInSnackBar(context, state.error!,
          );
        }
        else if (state.changePasswordModel!.listChangePassword!=null&&
            state.changePasswordModel!.listChangePassword!.isNotEmpty){
          if(state.changePasswordModel!.listChangePassword![0].result=='0')
            {
              showAlertDialog(context: context,
                  title:LocaleKeys.ttl_failed.tr(), msg: LocaleKeys.ttl_old_password_is_incorrect.tr(),
                  positivePressed: (){
                    Navigator.pop(context);
                  }
              );
            }
          else{
            showAlertDialog(context: context,
                title: LocaleKeys.ttl_success.tr(), msg: LocaleKeys.ttl_password_update.tr(),
                positivePressed: (){
                  Navigator.pop(context);
                }
            );
          }

        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state.isLoadingChange!,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 22.sp,
                  ),
                ),
                title: Text(
                  LocaleKeys.ttl_change_pass.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        TextFormFieldWidget(
                          labelText: LocaleKeys.ttl_old_password.tr(),
                          labelColor: MyColors.white,
                          isDense: true,
                          isPassword: _obscuredOld,
                          borderColor: Colors.white,
                          suffix: true,
                          toggleObscured: () {
                            _toggleObscured(old: true);
                          },
                          controller: oldPwdController,
                        ),
                        TextFormFieldWidget(
                          labelText: LocaleKeys.ttl_new_password.tr(),
                          labelColor: MyColors.white,
                          isPassword: _obscuredNew,
                          isDense: true,
                          borderColor: Colors.white,
                          suffix: true,
                          toggleObscured: () {
                            _toggleObscured(newPwd: true);
                          },
                          controller: newPwdController,
                        ),
                        TextFormFieldWidget(
                          labelText: LocaleKeys.ttl_re_new_password.tr(),
                          labelColor: MyColors.white,
                          isPassword: _obscuredRe,
                          isDense: true,
                          borderColor: Colors.white,
                          suffix: true,
                          toggleObscured: () {
                            _toggleObscured(re: true);
                          },
                          controller: rePwdController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButtonWidget(
                            onPressed: () {
                              String newPwd = newPwdController.text;
                              String rePwd = rePwdController.text;
                              String oldPwd = oldPwdController.text;
                              if(newPwd.isEmpty||oldPwd.isEmpty)
                                {
                                  showInSnackBar(context, LocaleKeys.msg_fill_all_field.tr());
                                }
                             else if(newPwd.length<5)
                                {
                                  showInSnackBar(context, LocaleKeys.msg_min_pass_length.tr());
                                }
                              else if(newPwd!=rePwd)
                                {
                                  showInSnackBar(context, LocaleKeys.msg_new_pass_not_matched.tr());
                                }
                              else{
                                widget.settingBloc.add(ChangePasswordEvent(
                                  oldPassword: oldPwd, newPassword: newPwd,
                                ));
                              }

                            },
                            text: LocaleKeys.ttl_update.tr(),
                            bgColor: MyColors.colorPrimary,
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    )),
              ),
            ));
      },
    );
  }

  void _toggleObscured({bool? old, bool? newPwd, bool? re}) {
    if (old != null) {
      setState(() {
        _obscuredOld = !_obscuredOld;
      });
      return;
    } else if (newPwd != null) {
      setState(() {
        _obscuredNew = !_obscuredNew;
      });
      return;
    } else {
      setState(() {
        _obscuredRe = !_obscuredRe;
      });
      return;
    }
  }
}
