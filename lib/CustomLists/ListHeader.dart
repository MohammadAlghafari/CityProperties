
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListHeader extends StatelessWidget {
  ListHeader({
    this.text,
    this.textColor=MyColors.white,
    this.bgColor=MyColors.colorBGBrown
});

  final String? text;
  final Color? textColor, bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      color: bgColor,
      child: Text(
        text??"",
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 13.sp
        ),
      ),


    );
  }
}
