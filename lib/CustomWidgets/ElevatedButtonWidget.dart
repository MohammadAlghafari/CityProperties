import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {
  //
  ElevatedButtonWidget({
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.text,
    this.borderColor = Colors.transparent,
    this.textColor,
    this.bgColor,
  });

  final VoidCallback? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? enabled;
  final String? text;
  final Color borderColor;
  final Color? textColor;
  final Color? bgColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
      child: ElevatedButton(
        child: Text(text!.toUpperCase(),
        style: TextStyle(
          fontSize: 13.5.sp
        ),
        ),
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          foregroundColor: MaterialStateProperty.all(textColor),
          padding: MaterialStateProperty.all(EdgeInsets.all(13.w)),//padding
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0.w),
                  side: BorderSide(color: borderColor,)
                )
            )
        ),


        ),
      );
  }
}