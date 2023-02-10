import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListGeneral.dart';
import 'package:cityproperties/CustomLists/ListVacantUnits.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/GalleryView/GalleryViewPage.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/WebView/WebViewer.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/myrentals_state.dart';

class RentalDetailPage extends StatefulWidget {
  final MyRentalsBloc myRentalsBloc;
  final String propCode;

  const RentalDetailPage(
      {Key? key, required this.myRentalsBloc, required this.propCode})
      : super(key: key);

  @override
  _RentalDetailPageState createState() => _RentalDetailPageState();
}

class _RentalDetailPageState extends State<RentalDetailPage> with BaseMixin {
  List<String>? images = [];

  @override
  void initState() {
    widget.myRentalsBloc
        .add(GetMyRentalsDetailsEvent(propCode: widget.propCode));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MyRentalsBloc, MyRentalsState>(
      bloc: widget.myRentalsBloc,
      listener: (context, state) {
        if(images!.isEmpty && state.myRentalsDetailsModel!=null)
          {
            for(var im in state.myRentalsDetailsModel!.contractImages!)
              {
                images!.add( AppConstants.serverUrlImages+ im.iMAGEPATH!);
              }
          }
      },
      child: BlocBuilder<MyRentalsBloc, MyRentalsState>(
        bloc: widget.myRentalsBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.white,
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
                '',
                style: TextStyle(fontSize: 16.sp),
              ),
              actions: [
                if (state.myRentalsDetailsModel != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: IconButton(
                      onPressed: () {
                        if(images!.isNotEmpty||state.myRentalsDetailsModel!.cOMPLAINREGISTRATIONIMAGE!=null)
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  GalleryView(
                                    imageUrlList: images!.isNotEmpty?images:null,
                                    imageUrl: state.myRentalsDetailsModel!.cOMPLAINREGISTRATIONIMAGE,
                                  )));
                        }
                        else{
                          showInSnackBar(context, LocaleKeys.ttl_NoContract.tr(),
                          );
                        }
                      },
                      icon: Image.asset('assets/contract_ic.png'),
                      iconSize: 19.sp,
                    ),
                  )
              ],
            ),
            body: state.isLoadingDetails!
                ? SizedBox(
                    height: 0.9.sh,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : state.myRentalsDetailsModel != null
                    ? RefreshIndicator(
                        onRefresh: () async {
                          widget.myRentalsBloc.add(GetMyRentalsDetailsEvent(
                              propCode: widget.propCode));
                        },
                        child: SafeArea(
                          child: RawScrollbar(
                            thickness: 5.w,
                            thumbColor: Colors.grey.shade500,
                            radius: Radius.circular(20.sp),
                            crossAxisMargin: 2.w,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.h),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/cplogo.png',
                                      height: 200.h,
                                    ),
                                    SizedBox(height: 20.h),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_tenant_name.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .tENANTNAME ??
                                          '',
                                    ),
                                    ListGeneral(
                                      typeExpand: 1,
                                      valueExpand: 1,
                                      type: LocaleKeys.ttl_contract_no.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .cONTRACTNO ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_property.tr(),
                                      value: isArabic(context)
                                          ? state.myRentalsDetailsModel!
                                                  .pROPERTYNAMEAR ??
                                          state.myRentalsDetailsModel!
                                              .pROPERTYNAME
                                          : state.myRentalsDetailsModel!
                                                  .pROPERTYNAME ??
                                              '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_building.tr(),
                                      value: isArabic(context)
                                          ? state.myRentalsDetailsModel!
                                                  .dEVNAMEAR ??
                                              ''
                                          : state.myRentalsDetailsModel!
                                                  .dEVNAME ??
                                              '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_unit_number.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .sHORTCODE ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_start_date.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .cONSTARTDT ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_end_date.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .cONENDDT ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_rent_amount.tr(),
                                      value: ("${state.myRentalsDetailsModel!
                                              .tRANSRENT ??
                                          '0'} ${LocaleKeys.ttl_aed.tr()}"),
                                    ),
                                    ListGeneral(
                                      typeExpand: 4,
                                      type:
                                          LocaleKeys.ttl_muni_cntrt_number.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .mUNCONTNO ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_area.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .aREANAME ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_city.tr(),
                                      value: state.myRentalsDetailsModel!
                                              .cITYNAME ??
                                          '',
                                    ),
                                    ListGeneral(
                                      type: LocaleKeys.ttl_parking.tr(),
                                      value: state.myRentalsDetailsModel!
                                                      .carParking !=
                                                  null &&
                                              state.myRentalsDetailsModel!
                                                  .carParking!.isNotEmpty
                                          ? state.myRentalsDetailsModel!
                                              .carParking![0].cPNO
                                          : LocaleKeys.ttl_no.tr(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0.9.sh,
                        child: ErrorTextWidget(
                          error: state.errorDetails!.isNotEmpty
                              ? state.errorDetails!
                              : LocaleKeys.ttl_No_Record_Available.tr(),
                        ),
                      ),
          );
        },
      ),
    );
  }
}
