
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListNotifications extends StatelessWidget {
  ListNotifications({this.title, this.notification});

  final String? title, notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      color: MyColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(_getIcon(title ?? ""),width: 35.w,),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.5.sp
                  ),
                ),
                SizedBox( height: 10.h,),
                Text(notification ?? "",
                style: TextStyle(
                  fontSize: 12.sp
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String _getIcon(String title) {
    if (title.toLowerCase().contains("police")) {
      return 'assets/noti_police.png';
    } else if (title.toLowerCase().contains("contract")) {
      return 'assets/noti_contract.png';
    } else if (title.toLowerCase().contains("cheque")) {
      return 'assets/noti_cheque.png';
    } else if (title.toLowerCase().contains("invoice")) {
      return 'assets/noti_invoice.png';
    } else if (title.toLowerCase().contains("case")) {
      return 'assets/noti_law.png';
    }
    else if (title.toLowerCase().contains("monthly")) {
      return 'assets/noti_law.png';
    }
    else if (title.toLowerCase().contains("maintenance")) {
      return 'assets/ic_mntc.png';
    }
    else {
      return 'assets/ic_noti_settings.png';
    }
  }
}
