
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomSheetAddComment extends StatelessWidget {
   String? comment;
   String? mobileNumber;

  BottomSheetAddComment({
    Key? key,
    required this.comment,
    required this.mobileNumber

  })
      : super(key: key);

  TextEditingController textEditingController=TextEditingController(

  );
   TextEditingController mobileNumberController=TextEditingController(

   );

  @override
  Widget build(BuildContext context) {
    mobileNumberController=TextEditingController(
        text: mobileNumber??''
    );
    textEditingController=TextEditingController(
      text: comment??""
    );

      return SafeArea(
        child: SizedBox(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15.h,),
              Padding(
                padding:  EdgeInsets.all(13.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.lbl_any_comments.tr(),
                      style: TextStyle(
                        fontSize: 16.w,
                        fontWeight: FontWeight.w700,
                      ),
                    )],
                ),
              ),
              SizedBox(height: 13.h,),
              Padding(
                padding:  EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,
                ),
                child: TextField(
                  maxLines: 1,
                  maxLength:10,
                  controller: mobileNumberController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered

                  decoration:  InputDecoration(
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.colorPrimary, width: 1.0.w),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.colorGrey, width: 1.0.w),
                    ),

                    label:  Text(LocaleKeys.ttl_mobile.tr()),
                    hintText: "05********"

                  ),
                ),
              ),
              SizedBox(height: 13.h,),
              Padding(
                padding:  EdgeInsets.only(
                  right: 10.w,
                  left: 10.w,

                ),
                child: TextField(
                  maxLines: 5,
                  maxLength:200,

                  controller: textEditingController,
                  decoration:  InputDecoration(
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.colorPrimary, width: 1.0.w),
                    ),
                    enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: MyColors.colorGrey, width: 1.0.w),
                    ),

                    label:  Text(LocaleKeys.lbl_any_comments.tr()),

                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding:  EdgeInsets.only(
                   bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text(LocaleKeys.ttl_cancel.tr(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.colorGrey

                      ),)),
                    TextButton(onPressed: (){
                        Navigator.pop(context,[textEditingController.text,
                          mobileNumberController.text
                        ]);
                    }, child: Text(LocaleKeys.lbl_ok.tr(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: MyColors.primaryTheme

                      ),)),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      );
  }
}
