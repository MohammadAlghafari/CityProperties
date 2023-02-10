
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CopyrightsPage extends StatefulWidget {
  const CopyrightsPage({Key? key}) : super(key: key);

  @override
  State<CopyrightsPage> createState() => _CopyrightsPageState();
}

class _CopyrightsPageState extends State<CopyrightsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.liteWhite,
      appBar: AppBar(

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            size: 22.sp,
          ),
        ),
        title: Text(LocaleKeys.ttl_credit_copy.tr(),style: TextStyle(
          fontSize: 16.sp
        ),),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 12.w
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w,20.h,20.w,10.h),
              color: MyColors.colorBGBrown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    LocaleKeys.ttl_copyrights_main.tr(),
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: 13.sp,
                        height: 1.3

                    ),

                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    LocaleKeys.ttl_copyrights_detail.tr(),
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,

                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          Padding(
            padding:  EdgeInsets.symmetric(
                horizontal: 12.w
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w,20.h,20.w,10.h),
              color: MyColors.colorBGBrown,
              child: Text(
                LocaleKeys.ttl_credits_main.tr(),
                  style: TextStyle(
                  color: MyColors.white,
                    fontSize: 13.sp,
                      height: 1.3
                  ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
