


import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardWidget extends StatelessWidget {
  final String imageIcon;
  final String title;
  final String body;
  final VoidCallback voidCallback;

  const DashboardWidget({Key? key,
     required this.imageIcon,
     required this.title,
     required this.body,
     required this.voidCallback

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: 12.w
      ),
      child: GestureDetector(
        onTap: (){
          voidCallback();
        },
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: 22.w,

            ),
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: 28.h
                  ),
                  child: Image.asset(imageIcon,
                  width:35.w,

                  ),
                ),
                  SizedBox(width: 10.w,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style:
                      TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: MyColors.colorBlack
                      ),),
                      SizedBox(height: 5.h,),
                      Text(body,
                      style:  TextStyle(
                            fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                            color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
