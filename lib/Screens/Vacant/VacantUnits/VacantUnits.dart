import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListVacantUnits.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_state.dart';
import 'package:cityproperties/WebView/WebViewer.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VacantUnitsPage extends StatefulWidget {
  final String cityCode;
  final String devCode;
  final String cityName;
  final String devName;
  final MyRentalsBloc myRentalsBloc;

  const VacantUnitsPage(
      {Key? key,
      required this.devCode,
      required this.cityCode,
        required this.cityName,
        required this.devName,
      required this.myRentalsBloc})
      : super(key: key);

  @override
  _VacantUnitsPageState createState() => _VacantUnitsPageState();
}

class _VacantUnitsPageState extends State<VacantUnitsPage> with BaseMixin {
  @override
  void initState() {
    widget.myRentalsBloc.add(
        GetVacantUnitEvent(devCode: widget.devCode, cityCode: widget.cityCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalsBloc, MyRentalsState>(
      bloc: widget.myRentalsBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
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
              widget.devName.isNotEmpty?widget.devName:widget.cityName,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          body: state.isLoadingDetails!
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.vacantUnitModel!.listVacantUnit != null &&
                      state.vacantUnitModel!.listVacantUnit!.isNotEmpty
                  ? SafeArea(
                      child: RawScrollbar(
                        thickness: 5.w,
                        thumbColor: Colors.grey.shade500,
                        radius: Radius.circular(20.sp),
                        crossAxisMargin: 2.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: ListView.separated(
                            itemCount:
                                state.vacantUnitModel!.listVacantUnit!.length,
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.h,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WebViewer(
                                            url:
                                                "${isArabic(context) ? AppConstants.vacantUnitArabicUrl :
                                                AppConstants.vacantUnitEnglishUrl}"
                                                "${state.vacantUnitModel!.listVacantUnit![index].pROPERTYCODE}"),
                                      ));

                                },
                                child: ListVacantUnits(
                                  name: '${isArabic(context)
                                      ? state.vacantUnitModel!
                                          .listVacantUnit![index].dEVNAMEAR??""
                                      : state.vacantUnitModel!
                                          .listVacantUnit![index].dEVNAME??""} - ${state.vacantUnitModel!
                                      .listVacantUnit![index].sHORTCODE!}',
                                  price: state.vacantUnitModel!
                                      .listVacantUnit![index].eXPECTEDPRICE,
                                  unitType: state.vacantUnitModel!
                                      .listVacantUnit![index].pROPERTYNAME,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 0.9.sh,
                      child:
                          RefreshIndicator(
                            onRefresh: ()async{
                              widget.myRentalsBloc.add(
                                  GetVacantUnitEvent(devCode: widget.devCode, cityCode: widget.cityCode));
                            },
                            child:ListView(

                              children: [
                                SizedBox(height: 0.45.sh,),
                                ErrorTextWidget(
                                  error: state.error!.isNotEmpty
                                      ? state.error!
                                      : LocaleKeys.ttl_No_Record_Available.tr(),
                                ),
                              ],
                            ) ,
                          ),


                    ),
        );
      },
    );
  }
}
