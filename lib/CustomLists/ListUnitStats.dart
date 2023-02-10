import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListUnitStats extends StatelessWidget {

  final String? statName,count;
  final Color? statColor;


  ListUnitStats({
    this.statName:"",
    this.statColor,
    this.count:""
      });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
      child: Column(

        children: [
          Text(
            statName!,
            style: TextStyle(
                fontSize: 14.sp,
                color: MyColors.colorBGBrown,
                // fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 7.h),
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.colorPrimary,width: 2.w),
              shape: BoxShape.circle,
              // You can use like this way or like the below line
              //borderRadius: new BorderRadius.circular(30.0),
              color: statColor,
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  count!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

