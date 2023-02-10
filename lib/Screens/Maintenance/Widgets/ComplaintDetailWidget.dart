
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/Screens/Maintenance/Model/MaintenanceHistoryModel.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComplaintDetailWidget extends StatelessWidget {
 final ListMaintenanceHistory listMaintHistory;
  const ComplaintDetailWidget({Key? key,
    required this.listMaintHistory

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            color: MyColors.colorBGBrownLite,
          ),
          child: Column(
            children: [
              Text(
                listMaintHistory.cOMPLAINTDESC!,
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 3.h,),
              Text(
                "${LocaleKeys.ttl_location.tr()}: ${listMaintHistory.sPOTDESC!}",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 3.h,),

              Text(
                "${LocaleKeys.ttl_status.tr()}: ${listMaintHistory.sTATUSNAME!}",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 14.sp,
                ),
              ),
              if(listMaintHistory.sTATUSNAME!.contains('Cancelled'))
                ...[
                  SizedBox(height: 3.h,),

                  Text(
                    "${LocaleKeys.ttl_reason.tr()}: ${listMaintHistory.rEASON!}",
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              SizedBox(height: 3.h,),

              Text(
                "${LocaleKeys.lbl_registration_date.tr()}: ${listMaintHistory.cMDATE!}",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 3.h,),

              Text(
                "${LocaleKeys.lbl_completion_date.tr()}: ${listMaintHistory.cMENDDATE!}",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 14.sp,
                ),
              ),

            ],
          )

      ),

    );
  }
}

