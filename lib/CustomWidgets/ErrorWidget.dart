

import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorTextWidget extends StatelessWidget {

  final String error;
  final Color? color;
  const ErrorTextWidget({Key? key,
      required this.error,
    this.color =MyColors.colorBlack,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        padding: EdgeInsets.all(8.w),
        child: Text(
          error,

          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );;
  }
}
