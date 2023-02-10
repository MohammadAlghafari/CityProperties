import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListMaintenanceHistory.dart';
import 'package:cityproperties/CustomWidgets/ElevatedButtonWidget.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/RateTheWork/Bloc/rate_bloc.dart';
import 'package:cityproperties/Screens/RateTheWork/Bloc/rate_state.dart';
import 'package:cityproperties/injection.dart';

import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RateTheWorkPage extends StatefulWidget {
  final String jobNo;
  const RateTheWorkPage({
    Key? key,
    required this.jobNo
  }) : super(key: key);

  @override
  _RateTheWorkPageState createState() => _RateTheWorkPageState();
}

class _RateTheWorkPageState extends State<RateTheWorkPage> with BaseMixin{

  int priceRate = -1;
  int serviceRate = -1;
  int behaviorRate = -1;
  int timeRate=-1;
  int materialRate=-1;
  TextEditingController textEditingController=TextEditingController(
    text: ''
  );

 late RateBloc rateBloc;

  @override
  void initState() {
    print(widget.jobNo);
    rateBloc=sl<RateBloc>();
    rateBloc.add(GetMyRateEvent(jobNo: widget.jobNo));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RateBloc, RateState>(
      bloc: rateBloc,
      listener: (context, state) {
        if(state.myRateModel!.listMyRate!=null&&state.myRateModel!.listMyRate!.isNotEmpty)
          {
            priceRate=int.parse(state.myRateModel!.listMyRate![0].pRICE!);
            serviceRate=int.parse(state.myRateModel!.listMyRate![0].qUALITY!);
            behaviorRate=int.parse(state.myRateModel!.listMyRate![0].tECHNICIAN!);
            timeRate=int.parse(state.myRateModel!.listMyRate![0].tIME!);
            materialRate=int.parse(state.myRateModel!.listMyRate![0].mATERIAL!);
            textEditingController.text=state.myRateModel!.listMyRate![0].cOMMENTS??'No Comment';
          }
        if (state.rateJobModel!.listRateJob!=null&&state.rateJobModel!.listRateJob!.isNotEmpty)
          {
            if(state.rateJobModel!.listRateJob![0].mstResult=="200")
              {
                showAlertDialog(
                  title: LocaleKeys.Done.tr(),
                  msg: LocaleKeys.ttl_Thankyou_very_much.tr(),
                  context: context,
                  positivePressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                );
              }
            else{
              showAlertDialog(
                  title: LocaleKeys.lbl_some_thing_wrong.tr(),
                  msg:state.errorRateWork!.isNotEmpty?state.errorRateWork!:
                  LocaleKeys.lbl_try_again_later.tr(),
                  context: context,
                  positivePressed: (){
                    Navigator.pop(context);
                   // Navigator.pop(context);
                  }
              );

            }
          }
        if(state.errorRateWork!.isNotEmpty){
          showAlertDialog(
              title: LocaleKeys.lbl_some_thing_wrong.tr(),
              msg:state.errorRateWork!,
              context: context,
              positivePressed: (){
                Navigator.pop(context);
                // Navigator.pop(context);
              }
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(inAsyncCall: state.isLoadingRateWork!,
            child: Scaffold(
            backgroundColor: MyColors.liteWhite,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 22.sp,
                ),
              ),
              title: Text(
                LocaleKeys.lbl_rate_the_work.tr(),
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
            body:state.isLoading!?
            const Center(
              child: CircularProgressIndicator(),
            ):
            state.error!.isEmpty?
            SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(color: MyColors.white,
                        child:
                        Padding(
                          padding:EdgeInsets.all(12.sp) ,
                          child: Row(

                            children: [
                              Expanded(child:   Text(
                                LocaleKeys.ttl_rate_price.tr(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: MyColors.colorBGBrown
                                ),
                              ),),

                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  priceRate=5;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:priceRate==5?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_happy.png",width: 22.w,
                                        color:priceRate==5? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  priceRate=4;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:priceRate==4?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_smile.png",width: 22.w,
                                        color:priceRate==4? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  priceRate=3;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:priceRate==3?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_confused.png",width: 22.w,
                                        color:priceRate==3? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  priceRate=2;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:priceRate==2?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_sad.png",width: 22.w,
                                        color:priceRate==2? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  priceRate=1;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:priceRate==1?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_angry.png",width: 22.w,
                                        color:priceRate==1? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),

                              SizedBox(width: 12.w,)
                            ],
                          ),
                        ),


                      ),
                      SizedBox(height: 5.h,),
                      Container(color: MyColors.white,
                        child:
                        Padding(
                          padding:EdgeInsets.all(12.sp) ,
                          child: Row(

                            children: [
                              Expanded(child:   Text(
                                LocaleKeys.ttl_rate_service.tr(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: MyColors.colorBGBrown
                                ),
                              ),),

                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  serviceRate=5;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:serviceRate==5?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_happy.png",width: 22.w,
                                        color:serviceRate==5? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  serviceRate=4;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:serviceRate==4?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_smile.png",width: 22.w,
                                        color:serviceRate==4? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  serviceRate=3;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:serviceRate==3?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_confused.png",width: 22.w,
                                        color:serviceRate==3? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  serviceRate=2;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:serviceRate==2?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_sad.png",width: 22.w,
                                        color:serviceRate==2? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  serviceRate=1;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:serviceRate==1?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_angry.png",width: 22.w,
                                        color:serviceRate==1? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),

                              SizedBox(width: 12.w,)
                            ],
                          ),
                        ),



                      ),
                      SizedBox(height: 5.h,),
                      Container(color: MyColors.white,
                        child:
                        Padding(
                          padding:EdgeInsets.all(12.sp) ,
                          child: Row(

                            children: [
                              Expanded(child:   Text(
                                LocaleKeys.ttl_rate_behaviour.tr(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: MyColors.colorBGBrown
                                ),
                              ),),

                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  behaviorRate=5;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:behaviorRate==5?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_happy.png",width: 22.w,
                                        color:behaviorRate==5? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  behaviorRate=4;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:behaviorRate==4?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_smile.png",width: 22.w,
                                        color:behaviorRate==4? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  behaviorRate=3;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:behaviorRate==3?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_confused.png",width: 22.w,
                                        color:behaviorRate==3? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  behaviorRate=2;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:behaviorRate==2?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_sad.png",width: 22.w,
                                        color:behaviorRate==2? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  behaviorRate=1;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:behaviorRate==1?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_angry.png",width: 22.w,
                                        color:behaviorRate==1? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),

                              SizedBox(width: 12.w,)
                            ],
                          ),
                        ),


                      ),
                      SizedBox(height: 5.h,),
                      Container(color: MyColors.white,
                        child:
                        Padding(
                          padding:EdgeInsets.all(12.sp) ,
                          child: Row(

                            children: [
                              Expanded(child:   Text(
                                LocaleKeys.ttl_rate_time.tr(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: MyColors.colorBGBrown
                                ),
                              ),),

                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  timeRate=5;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:timeRate==5?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_happy.png",width: 22.w,
                                        color:timeRate==5? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  timeRate=4;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:timeRate==4?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_smile.png",width: 22.w,
                                        color:timeRate==4? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  timeRate=3;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:timeRate==3?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_confused.png",width: 22.w,
                                        color:timeRate==3? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  timeRate=2;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:timeRate==2?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_sad.png",width: 22.w,
                                        color:timeRate==2? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  timeRate=1;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:timeRate==1?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_angry.png",width: 22.w,
                                        color:timeRate==1? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),

                              SizedBox(width: 12.w,)
                            ],
                          ),
                        ),


                      ),
                      SizedBox(height: 5.h,),
                      Container(color: MyColors.white,
                        child:
                        Padding(
                          padding:EdgeInsets.all(12.sp) ,
                          child: Row(

                            children: [
                              Expanded(child:   Text(
                                LocaleKeys.ttl_rate_material.tr(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: MyColors.colorBGBrown
                                ),
                              ),),

                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  materialRate=5;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:materialRate==5?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_happy.png",width: 22.w,
                                        color:materialRate==5? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  materialRate=4;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:materialRate==4?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_smile.png",width: 22.w,
                                        color:materialRate==4? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  materialRate=3;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:materialRate==3?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_confused.png",width: 22.w,
                                        color:materialRate==3? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  materialRate=2;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:materialRate==2?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_sad.png",width: 22.w,
                                        color:materialRate==2? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),
                              SizedBox(width: 6.w,),
                              InkWell(
                                onTap: (){
                                  materialRate=1;
                                  setState(() {

                                  });
                                },
                                child:
                                Container(
                                    decoration: BoxDecoration(
                                      color:materialRate==1?
                                      MyColors.colorGold:Colors.transparent,
                                      borderRadius: BorderRadius.circular(7.w),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.all(10.sp),
                                      child: Image.asset("assets/emo_angry.png",width: 22.w,
                                        color:materialRate==1? MyColors.liteWhite:
                                        null,
                                      ),
                                    )
                                ),

                              ),

                              SizedBox(width: 12.w,)
                            ],
                          ),
                        ),


                      ),
                      SizedBox(height: 30.h,),
                      Padding(
                        padding:  EdgeInsets.only(
                          right: 10.w,
                          left: 10.w,

                        ),
                        child: TextField(
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 14.sp
                          ),
                          maxLength:100,


                          controller: textEditingController,
                          decoration:  InputDecoration(
                            counterStyle: TextStyle(
                                fontSize: 11.sp),
                            focusedBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: MyColors.colorPrimary, width: 1.0.w),
                            ),
                            enabledBorder:  OutlineInputBorder(
                              borderSide: BorderSide(color: MyColors.colorGrey, width: 1.0.w),
                            ),


                            label: Text(LocaleKeys.lbl_any_comments.tr()),
                            labelStyle:TextStyle(
                                fontSize: 14.sp
                            ) ,


                          ),

                        ),
                      ),
                      SizedBox(height: 30.h,),
                      if(state.myRateModel!.listMyRate==null||state.myRateModel!.listMyRate!.isEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButtonWidget(
                            onPressed: () {
                              if(priceRate>0&&serviceRate>0&&behaviorRate>0&&timeRate>0&&materialRate>0) {
                                  rateBloc.add(RateWorkEvent(jobNo: widget.jobNo,
                                      comments: textEditingController.text.trim(),
                                      userRating: "$priceRate,$materialRate,$behaviorRate,$serviceRate,$timeRate"
                                  ));
                              }
                              else{
                                showAlertDialog(context: context,
                                    title: LocaleKeys.Sorry.tr(),
                                    msg: LocaleKeys.lbl_rating_not.tr(),
                                    positivePressed: (){
                                      Navigator.pop(context);
                                    }

                                );
                              }

                            },
                            text: LocaleKeys.Done.tr(),
                            bgColor: MyColors.colorBGBrown,
                            textColor: Colors.white,
                          ),
                        ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                  if(state.myRateModel!.listMyRate!=null&&state.myRateModel!.listMyRate!.isNotEmpty)
                    InkWell(
                      onTap: (){},
                      child: SizedBox(height: 0.9.sh,
                        width: 1.sw,),
                    )

                ],
              ),
            ):ErrorTextWidget(
              error: state.error!,
            )
        ));
      },
    );
  }
}
