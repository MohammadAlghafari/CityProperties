

import 'package:cityproperties/CustomWidgets/ArrowIconWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListComplaintWidget extends StatelessWidget with BaseMixin{
  ListComplaintWidget({
    this.type,
    this.value,
    this.onPressed:null,
    this.typeColor: MyColors.colorBGBrown,
    this.valueColor: Colors.black
});

  final String? type, value;
  final Color typeColor, valueColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: MyColors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10.w),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              type??"",
              textAlign: TextAlign.start,
                maxLines: 1,
                style: TextStyle(
                  color:typeColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp
                ),

            ),

           SizedBox(width: 8.w),

            Expanded(
              child: Text(

                value??"",
                textDirection: TextDirection.ltr,
                textAlign:isArabic(context)? TextAlign.start:TextAlign.end,
                maxLines: 1,
                style: TextStyle(
                  color: valueColor,
                    fontSize: 12.sp
                ),
                overflow: TextOverflow.ellipsis,
              ),

            ),
            ArrowIconWidget()
          ],
        ),

      ),
    );
  }
}
