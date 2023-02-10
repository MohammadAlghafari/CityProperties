import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';


class ListVacantUnits extends StatelessWidget {



  final String? name, unitType, price;


  const ListVacantUnits({
    Key? key,
    this.name,
    this.unitType,
    this.price,

  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Container(
        // height: 100.h,
        // color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 13.w
        ),
        child: Row(

          children: [
            SizedBox(width: 15.w),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    maxLines: 2,
                    style: TextStyle(
                      color: MyColors.colorBGBrown,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                  '${LocaleKeys.ttl_unit_type.tr()} : ${unitType!}',
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5.w),
            Stack(
              alignment: Alignment.center,

              children: [
                Image.asset('assets/pricebanner.png',
                fit: BoxFit.fill,
                height: 70.h,
                  width: 67.5.w,

                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.lbl_from.tr(),
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: MyColors.white
                      ),
                    ),
                    Text(
                      price??"",
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white
                      ),
                    ),
                    Text(
                      LocaleKeys.ttl_aed.tr(),
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: MyColors.white
                      ),
                    ),
                    SizedBox(height: 12.h,)
                  ],
                ),
              ],
            ),

            SizedBox(width: 5.w),

          ],
        ),

      ),
    );
  }
}

