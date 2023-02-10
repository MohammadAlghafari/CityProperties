


import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../CustomColors/MyColors.dart';
import '../translations/locale_keys.g.dart';


class ArrowIconWidget extends StatelessWidget {


  final Color? color;

  const ArrowIconWidget({Key? key, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
        constraints: const BoxConstraints(),
        onPressed: null,
        icon:  Icon(
          Icons.arrow_forward_ios,
          color: color??MyColors.colorBGBrown,
        ),
        iconSize: 17.5.sp,

      );

  }
}