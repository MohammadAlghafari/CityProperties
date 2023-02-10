import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';

class ListLegal extends StatelessWidget {
  final String? buildingName, count;
  ListLegal({
    this.buildingName,
    this.count,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all( 10.w),

        child: Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Text(
                buildingName!,
                style: TextStyle(
                    fontSize: 14.sp,

                ),
              )
            ),

            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Card(
                    color: MyColors.colorBGBrown,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(20.w)
                      ),
                  ),

                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.all(10.w),
                      child: Text(
                        count!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),

                  ),
              ),
            ),


          ],
        ),

      ),
    );
  }
}

