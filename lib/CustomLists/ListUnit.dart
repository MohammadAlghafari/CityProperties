import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListUnit extends StatelessWidget {
  final String? devName, propertyName, shortCode;

  ListUnit({
    this.devName:"",
    this.propertyName:"",
    this.shortCode:"",
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Container(
        // color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      devName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      propertyName!,
                      style: TextStyle(
                        color: MyColors.colorBGBrown,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            shortCode!.length > 4
                ? Text(
                    shortCode!,
                    style: TextStyle(
                      color: MyColors.colorBGBrown,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp
                    ),
                    textAlign: TextAlign.center,
                  )
                : CircleAvatar(
                    backgroundColor: MyColors.colorBGBrown,
                    radius: 22.w,
                    child: Text(
                      shortCode!,
                      style: TextStyle(
                        color: MyColors.white,
                        fontSize: 13.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
