import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListUnitDetail extends StatelessWidget {
  const ListUnitDetail({Key? key,
    this.icon:"",
    this.type:"",
    this.value:"",
}
      ) : super(key: key);

  final String? icon, type, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          color: Colors.white,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                icon!,
                height: 18.h,
                // icon: Image.asset('name')
              ),
              SizedBox(width: 15.w),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  type!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: MyColors.colorBGBrown,
                      fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.start,

                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  value!,
                  style: TextStyle(
                      fontSize: 13.sp,
                  ),
                  textAlign: TextAlign.end,

                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
        ),
      ],
    );
  }
}
