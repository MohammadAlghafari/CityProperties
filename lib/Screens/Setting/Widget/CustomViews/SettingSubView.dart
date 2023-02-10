
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ArrowIconWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingSubView extends StatelessWidget {
  SettingSubView({this.text, this.icon, this.onTap});

  final String? text, icon;
  final VoidCallback? onTap;

  // final ImageIcon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.w),
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                icon!,
                width: 27.w,
                // icon: Image.asset('name')
              ),
              SizedBox(width: 10.w),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  text!,
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: MyColors.colorBGBrown,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ArrowIconWidget()
            ],
          ),
        ),
      ),
    );
  }
}
