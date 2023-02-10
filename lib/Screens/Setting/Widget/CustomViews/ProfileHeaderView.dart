import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ArrowIconWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileHeaderView extends StatelessWidget with BaseMixin {
  ProfileHeaderView({Key? key, this.name, this.email, this.number, this.image})
      : super(key: key);

  final String? name, email, number, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (image!.contains("NoPhotoAvailable.jpg") || image!.contains(":"))
            Container(
              width: 75.sp,
              height: 75.sp,
              decoration: const BoxDecoration(


                image: DecorationImage(
                  image: AssetImage(
                    "assets/cplogo.png",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            )
          else
            CachedNetworkImage(
              imageUrl: "http://tenant.cityproperties.ae/$image",
              imageBuilder: (context, imageProvider) => Container(
                width: 75.sp,
                height: 75.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Image.asset(
                "assets/cplogo.png",
              ),
            ),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: MyColors.colorBGBrown,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    // color: MyColors.colorBGBrown,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  number!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    // color: MyColors.colorBGBrown,
                  ),
                ),
              ],
            ),
          ),
          const ArrowIconWidget(),
        ],
      ),
    );
  }
}
