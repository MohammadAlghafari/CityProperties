
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/TextFormFieldWidget.dart';
import 'package:cityproperties/Screens/Setting/Bloc/setting_bloc.dart';
import 'package:cityproperties/Screens/Setting/Model/ProfileModel.dart';
import 'package:cityproperties/Screens/Setting/Widget/EditPassword/EditPasswordPage.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfilePage extends StatefulWidget {
  final ListProfileModel profile;
  final SettingBloc settingBloc;
  const ProfilePage({Key? key, required this.profile,
    required this.settingBloc
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ListProfileModel profile;

  @override
  void initState() {
    profile = widget.profile;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorBGBrown,
      appBar: AppBar(

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
          size: 22.sp,
          ),
        ),
        title: Text(LocaleKeys.ttl_edit_profile.tr(),
        style: TextStyle(
          fontSize: 16.sp
        ),
        ),
        actions: [
           IconButton(
            icon: Image.asset('assets/icon_key_password.png',
            width: 22.w,
            ),
            onPressed: () {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  EditPasswordPage(
                          settingBloc: widget.settingBloc,

                        )));

            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child:Column(
            children: [
              SizedBox(height: 25.h,),
              TextFormFieldWidget(
                readOnly: true,
                hintText: profile.tENANTNAME,
                enabled: false,
                isDense: true,
                borderColor: Colors.white,
                hintColor:Colors.white ,

              ),

              Theme(
                data: Theme.of(context).copyWith(
                    unselectedWidgetColor: MyColors.white,
                    disabledColor: MyColors.white
                ),
                child: Row(

                  children: [
                    Expanded(
                      child: RadioListTile(
                          groupValue: profile.gENDER!.toLowerCase()=="m",
                          title: Text(
                              LocaleKeys.ttl_male.tr(),
                            style: TextStyle(
                              color: MyColors.white,
                              fontSize: 13.sp
                            ),
                          ),
                        value:! profile.gENDER!.contains("M")
                         ,
                        onChanged: null,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        groupValue: profile.gENDER!.toLowerCase()=="m"
                       ,
                        title: Text(
                          LocaleKeys.ttl_female.tr(),
                          style: TextStyle(
                              color: MyColors.white,
                              fontSize: 13.sp
                          ),
                        ),
                        value:! profile.gENDER!.contains("F"),
                        onChanged: null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              TextFormFieldWidget(
                readOnly: true,
                hintText: profile.eMAIL,
                enabled: false,
                isDense: true,
                borderColor: Colors.white,
                hintColor:Colors.white ,

              ),
              SizedBox(height: 10.h,),
              TextFormFieldWidget(
                readOnly: true,
                hintText: profile.mOBILE,
                enabled: false,
                isDense: true,
                borderColor: Colors.white,
                hintColor:Colors.white ,
              ),
              SizedBox(height: 10.h,),

              // TextFormFieldWidget(
              //   readOnly: true,
              //   hintText: '',
              //   enabled: false,
              //   isDense: true,
              //   borderColor: Colors.white,
              //   hintColor:Colors.white ,
              //
              // ),
            ],
          )

        ),
      ),
    );
  }
}
