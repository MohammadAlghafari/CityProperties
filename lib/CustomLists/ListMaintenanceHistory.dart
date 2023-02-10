
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';


class ListMaintenanceHistoryWidget extends StatelessWidget with BaseMixin{
  final String? spotDesc, jobNo, requestType, status, complaint;

  ListMaintenanceHistoryWidget({Key? key,
    this.status,
    this.complaint,
    this.jobNo:"",
    this.requestType,
    this.spotDesc:"",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color:MyColors.colorBGBrown,
      ),

      child: IntrinsicHeight(
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: 100.w,
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: MyColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    getTypeIcon(requestType??""),
                    width: 30.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    requestType??"",
                    maxLines: 2,
                    style: TextStyle(
                      color: MyColors.colorBGBrown,
                      fontSize: 13.sp
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            SizedBox(
              width: 5.w,
            ),

            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 5.w,top: 10.h,bottom: 10.h,right: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: MyColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${LocaleKeys.ttl_job_no.tr()}: ${jobNo!}',
                            style: TextStyle(
                              fontSize: 12.sp
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            '${LocaleKeys.ttl_complain_spot.tr()} ${spotDesc!}',
                            style: TextStyle(
                                fontSize: 11.sp
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            complaint??"",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 11.sp

                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            setStatusImage(status??""),
                            width: 20.w,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            status??"",
                            style: TextStyle(
                              fontSize: 9.sp,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
