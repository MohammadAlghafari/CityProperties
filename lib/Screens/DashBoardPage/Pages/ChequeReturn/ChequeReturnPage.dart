import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListHeader.dart';
import 'package:cityproperties/CustomLists/ListNotifications.dart';
import 'package:cityproperties/CustomWidgets/ErrorWidget.dart';
import 'package:cityproperties/GalleryView/GalleryViewPage.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_bloc.dart';
import 'package:cityproperties/Screens/DashBoardPage/Bloc/dashboard_state.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChequeReturnPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;

  const ChequeReturnPage({Key? key, required this.dashboardBloc})
      : super(key: key);

  @override
  State<ChequeReturnPage> createState() => _ChequeReturnPageState();
}

class _ChequeReturnPageState extends State<ChequeReturnPage> with BaseMixin {
  @override
  void initState() {
    widget.dashboardBloc.add(GetChequeReturnEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: widget.dashboardBloc,
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
              LocaleKeys.ttl_list_cheque_returns.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: state.isLoading!
                ? SizedBox(
                    height: 0.9.sh,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ) ,

                  )
                : state.chequeReturnModel.listChequeReturn != null &&
                        state.chequeReturnModel.listChequeReturn!.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.chequeReturnModel.listChequeReturn!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: 20.h, left: 3.w, right: 3.w),
                            child: Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          '#${state.chequeReturnModel.listChequeReturn![index].cHEQUENO}  ',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: MyColors.colorBlack,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${LocaleKeys.ttl_contract_no.tr()}:${state.chequeReturnModel.listChequeReturn![index].cONTRACTNO}',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: MyColors.colorBlack,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/warning.png',
                                          width: 20.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${LocaleKeys.ttl_chq_return_date.tr()} : ${
                                                getFormattedDate(state.chequeReturnModel.listChequeReturn![index].cHQURETDATE!,
                                                outputFormat: DateFormat.YEAR_ABBR_MONTH_DAY
                                                )}',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey.shade800),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${LocaleKeys.ttl_reason_of_return.tr()} : ${state.chequeReturnModel.listChequeReturn![index].cHQRETREASON}',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.grey.shade800),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : SizedBox(
                        height: 0.9.sh,
                        child: ErrorTextWidget(
                          error: state.error!.isNotEmpty
                              ? state.error!
                              : LocaleKeys.ttl_No_Record_Available.tr(),
                        ),
                      ),
          ),
        );
      },
    );
  }
}
