
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListGeneral extends StatelessWidget {
  ListGeneral({
    this.type,
    this.value,
    this.typeExpand:1,
    this.valueExpand:2,
    this.typeColor: MyColors.colorBGBrown,
    this.valueColor:Colors.black
});

  final String? type, value;
  int typeExpand , valueExpand;
  Color typeColor, valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: MyColors.white,
          padding: EdgeInsets.all(13.w),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: typeExpand,
                child: Text(
                  type??"",
                  textAlign: TextAlign.start,
                    style: TextStyle(
                      color:typeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5.sp
                    ),

                ),
              ),

              Expanded(
                flex: valueExpand,
                child: Text(
                  value??"",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: valueColor,
                    fontSize: 12.5.sp
                  ),
                ),
              )
            ],
          ),

        ),

        Divider(
          thickness: 1,
          height: 0,
        )
      ],
    );
  }
}
