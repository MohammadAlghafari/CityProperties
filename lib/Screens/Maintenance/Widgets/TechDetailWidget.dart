
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/Screens/Maintenance/Model/TechDate.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class TechDetailWidget extends StatelessWidget {
  final Technician? technician;
  final String statusName;

  const TechDetailWidget({Key? key,
  required this.statusName,
    required this.technician
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        technician!=null?
        CachedNetworkImage(
          width: 90.w,
          height: 90.w,
          imageUrl: AppConstants.serverUrlTechImages
              +technician!.eMPPICT!,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(child:  CircularProgressIndicator()),
          errorWidget: (context, url, error) => Image.asset('assets/ic_technician.png',
            width: 90.w,),
        ):
        Image.asset('assets/ic_technician.png',
          width: 90.w,),

        SizedBox(width: 20.w,),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Expanded(
                    child: RichText(
                      maxLines: 3,
                      text: TextSpan(
                        // style: Theme.of(context).textTheme.body1,
                        children: [


                          TextSpan(
                              text:
                              !statusName.contains('Received')? '${LocaleKeys.lbl_maintenance_req_as_to.tr()} ':
                              LocaleKeys.ttl_maintenance_req_not_as.tr() ,
                              style: TextStyle(color: MyColors.colorBlack, fontSize: 14.sp)
                          ),
                          if(technician!=null)
                            ...[
                              TextSpan(
                                  text:
                                  technician!.eMPNAME!,
                                  style: TextStyle(color: MyColors.colorBlack, fontSize: 14.sp)
                              ),
                            ]

                        ],
                      ),
                    ),
                  ),


                ],
              ),
              SizedBox(height: 5.h,),
              if(technician!=null)
                RichText(
                  text: TextSpan(
                    // style: Theme.of(context).textTheme.body1,
                    children: [
                      if(!statusName.contains('Received'))
                      WidgetSpan(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w),
                          child: Icon(Icons.phone,
                            size: 22.sp,
                            color: Colors.green,),
                        ),
                      ),

                      TextSpan(text: technician!.eMPPHONE!,
                          style: TextStyle(color: MyColors.colorBlack, fontSize: 14.sp)),
                    ],
                  ),
                )

            ],
          ),
        )
      ],

    );
  }
}

