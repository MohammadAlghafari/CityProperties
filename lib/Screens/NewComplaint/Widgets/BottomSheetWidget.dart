
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BottomSheetWidget extends StatelessWidget {
  final List? properties;

  final List? services;

  final List? locations;

  final List? complaints;

  BottomSheetWidget({
    Key? key,
    this.properties,
    this.services,
    this.locations,this.complaints
  })
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    if(properties!=null) {
      return SafeArea(
      child: Container(

        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:  EdgeInsets.all(13.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text( LocaleKeys.lbl_comp_property.tr(),
                    style: TextStyle(
                        fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                   )],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                 bottom: 30.h,
                left: 8.w,
                right: 8.w
              ),
              child: ListView.builder(
                 shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: properties!.length,
                itemBuilder:(context, index) {

                      return InkWell(
                        onTap: (){
                          Navigator.pop(context,properties![index]);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: MyColors.colorGrey
                              )
                            ),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(12.0.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(properties![index].pROPERTYNAME!,
                                 style: TextStyle(
                                   fontSize: 14.sp,

                                 ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );



              }, ),
            ),
          ],
        ),
      ),
    );
    } else  if(services!=null) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(

            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:  EdgeInsets.all(15.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys
                          .dtl_comp_requesttype.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 30,
                      left: 8,
                      right: 8
                  ),
                  child: SizedBox(

                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      itemCount: services!.length,
                      itemBuilder:(context, index) {

                        return InkWell(
                          onTap: (){
                            Navigator.pop(context,services![index]);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: MyColors.colorGrey
                                  )
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(12.0.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(services![index].sERVICETYPENAME!,
                                    style: TextStyle(
                                      fontSize: 14.sp,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );



                      }, ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  } else  if(locations!=null) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Container(

            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:  EdgeInsets.all(15.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.lbl_comp_location.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                      bottom: 30.h,
                      left: 8.w,
                      right: 8.w
                  ),
                  child: SizedBox(

                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      itemCount: locations!.length,
                      itemBuilder:(context, index) {

                        return InkWell(
                          onTap: (){
                            Navigator.pop(context,locations![index]);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: MyColors.colorGrey
                                  )
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(12.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(locations![index].sPOTDESC??'',
                                    style: TextStyle(
                                      fontSize: 14.sp,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );



                      }, ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else  if(complaints!=null) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Container(

            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:  EdgeInsets.all(15.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(LocaleKeys.lbl_comp_complaint.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      )],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(
                      bottom: 30.h,
                      left: 8.w,
                      right: 8.w
                  ),
                  child: SizedBox(

                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,

                      itemCount: complaints!.length,
                      itemBuilder:(context, index) {

                        return InkWell(
                          onTap: (){
                            Navigator.pop(context,complaints![index]);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: MyColors.colorGrey
                                  )
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(12.0.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(complaints![index].cOMPLAINTDESC??'',
                                    style: TextStyle(
                                      fontSize: 14.sp,

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );



                      }, ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
