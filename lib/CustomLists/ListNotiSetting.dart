
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ListNotiSetting extends StatelessWidget {

  ListNotiSetting({
    this.name,
    this.value,
    this.onTap,
  });

  final String? name;
  final int? value;
  final Function(bool?)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:MyColors.white,
      padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name??"",
              style: TextStyle(
                fontSize: 14.sp,
                color: MyColors.colorBGBrown,
                fontWeight: FontWeight.w500
              ),

            ),
          ),
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              checkColor: MyColors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              onChanged: onTap,
              value: value==2,

            ),
          )
        ],
      ),
    );
  }
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return MyColors.colorPrimary;
    }
    return MyColors.colorBGBrown;
  }
}
