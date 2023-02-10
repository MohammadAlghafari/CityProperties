import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_bloc.dart';
import 'package:cityproperties/Screens/MyRentals/Bloc/myrentals_state.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../CustomLists/ListRealEstate.dart';
import 'VacantUnits/VacantUnits.dart';

class VacantPage extends StatefulWidget {
  final MyRentalsBloc myRentalsBloc;

  const VacantPage({Key? key, required this.myRentalsBloc}) : super(key: key);

  @override
  _VacantPageState createState() => _VacantPageState();
}

class _VacantPageState extends State<VacantPage> with BaseMixin {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyRentalsBloc, MyRentalsState>(
      bloc: widget.myRentalsBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: MyColors.liteWhite,
            appBar: AppBar(
              title: Text(
                LocaleKeys.tab_min_vacant_units.tr(),
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            body: SafeArea(
              child: Container(
                  color: MyColors.liteWhite,
                  child: RefreshIndicator(
                    onRefresh: ()async{
                      widget.myRentalsBloc.add(GetMyRentalsEvent());
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()
                      ),
                      child: state.isLoading!
                          ? SizedBox(
                        height: 0.9.sh,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                          : state.myRentalsModel!.listMyRentals != null &&
                          state
                              .myRentalsModel!.listMyRentals!.isNotEmpty
                          ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(14.0.sp),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.ttl_in_my_vacants.tr(),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13.sp,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            itemCount: state.myRentalsModel!
                                .listMyRentals!.length,
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            VacantUnitsPage(myRentalsBloc: widget.myRentalsBloc,
                                              cityCode: '',
                                              devName: state
                                                  .myRentalsModel!
                                                  .listMyRentals![
                                              index].dEVNAME!,
                                              devCode:state
                                                  .myRentalsModel!
                                                  .listMyRentals![
                                              index].dEVCODE! ,
                                              cityName: '',
                                            ),
                                      ));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: MyColors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                            color:
                                            MyColors.colorGrey),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0.sp),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            isArabic(context)
                                                ? state
                                                .myRentalsModel!
                                                .listMyRentals![
                                            index]
                                                .dEVNAMEAR ??
                                                ""
                                                : state
                                                .myRentalsModel!
                                                .listMyRentals![
                                            index]
                                                .dEVNAME ??
                                                "",
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: MyColors
                                                  .colorBGBrown,
                                              fontWeight:
                                              FontWeight.w500,
                                              fontSize: 15.sp,
                                            ),
                                            overflow:
                                            TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 17.sp,
                                          color: MyColors.colorGrey,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Padding(
                            padding: EdgeInsets.all(14.0.sp),
                            child: Row(
                              children: [
                                Text(
                                  LocaleKeys.ttl_in_others_vacants
                                      .tr(),
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 13.sp,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VacantUnitsPage(myRentalsBloc: widget.myRentalsBloc,
                                          cityName: LocaleKeys.sharjah.tr(),
                                          cityCode: AppConstants.cityCodeSharjah,
                                          devName: '',
                                          devCode:'' ,
                                        ),
                                  ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: MyColors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                        color: MyColors.colorGrey),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(14.0.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.sharjah.tr(),
                                        maxLines: 2,
                                        style: TextStyle(
                                          color:
                                          MyColors.colorBGBrown,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 17.sp,
                                      color: MyColors.colorGrey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VacantUnitsPage(myRentalsBloc: widget.myRentalsBloc,
                                          cityCode: AppConstants.cityCodeAjman,
                                          cityName: LocaleKeys.ajman.tr(),
                                          devName: '',
                                          devCode:'' ,
                                        ),
                                  ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: MyColors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                        color: MyColors.colorGrey),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(14.0.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.ajman.tr(),
                                        maxLines: 2,
                                        style: TextStyle(
                                          color:
                                          MyColors.colorBGBrown,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 17.sp,
                                      color: MyColors.colorGrey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VacantUnitsPage(myRentalsBloc: widget.myRentalsBloc,
                                          cityCode: AppConstants.cityCodeDubai,
                                          cityName: LocaleKeys.dubai.tr(),
                                          devName: '',
                                          devCode:'' ,
                                        ),
                                  ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: MyColors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                        color: MyColors.colorGrey),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(14.0.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.dubai.tr(),
                                        maxLines: 2,
                                        style: TextStyle(
                                          color:
                                          MyColors.colorBGBrown,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 17.sp,
                                      color: MyColors.colorGrey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VacantUnitsPage(myRentalsBloc: widget.myRentalsBloc,
                                          cityCode: AppConstants.cityCodeAbuDhabi,
                                          cityName:  LocaleKeys.abudhabi.tr(),
                                          devName: '',
                                          devCode:'' ,
                                        ),
                                  ));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: MyColors.white,
                                  border: Border(
                                    bottom: BorderSide(
                                        color: MyColors.colorGrey),
                                  )),
                              child: Padding(
                                padding: EdgeInsets.all(14.0.sp),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        LocaleKeys.abudhabi.tr(),
                                        maxLines: 2,
                                        style: TextStyle(
                                          color:
                                          MyColors.colorBGBrown,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15.sp,
                                        ),
                                        overflow:
                                        TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 17.sp,
                                      color: MyColors.colorGrey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                          : SizedBox(
                        height: 0.9.sh,
                        child: ErrorTextWidget(
                          error: state.error!.isNotEmpty
                              ? state.error!
                              : LocaleKeys.ttl_No_Record_Available
                              .tr(),
                        ),
                      ),
                    ),
                  )),
            ));
      },
    );
  }
}
