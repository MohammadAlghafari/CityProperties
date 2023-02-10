
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/Screens/Maintenance/Model/JobMaterialDataModel.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListMaterials extends StatelessWidget {
  final ListJobMaterialData listJobMaterialData;
  const ListMaterials({Key? key,
    required this.listJobMaterialData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      child: Row(
        children: [
          listJobMaterialData.iTEMPICPATH!=null?
          CachedNetworkImage(
            width: 35.w,
            height: 35.w,
            imageUrl: AppConstants.serverUrlTechImages+listJobMaterialData.iTEMPICPATH!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>   Image.asset('assets/ic_maintainic.png', width: 35.w,),
          ):
          Image.asset('assets/ic_maintainic.png', width: 35.w,),

          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                listJobMaterialData.dESCRIPTION?? 'Material Name,',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),

          Text(
              '${listJobMaterialData.rATE??''} ${LocaleKeys.ttl_aed.tr()}',
            style: TextStyle(
              fontSize: 14.sp
            ),
          )


        ],
      ),
    );
  }
}
