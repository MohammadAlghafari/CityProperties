import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';


class ListRealEstate extends StatelessWidget {



  final String? name, city, shortCode;
  final bool? realEstate;

  const ListRealEstate({
    Key? key,
    this.name,
    this.city,
    this.shortCode,
    this.realEstate=false
  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.all(15.w),
        child: Row(

          children: [
            Image.asset(
              realEstate!? "assets/ic_aprt.png":"assets/ic_mntc.png",
              height: realEstate??true?37.h:32.h,
            ),

            SizedBox(width: 10.w),
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
                      fontSize: 15.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    city!,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.w),
                color: MyColors.colorBGBrown
              ),
              child: Padding(
                padding:  EdgeInsets.all(10.0.sp),
                child: Text(
                  shortCode??"",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: MyColors.white
                  ),
                ),
              ),
            ),


          ],
        ),

      ),
    );
  }
}

