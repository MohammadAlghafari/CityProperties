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

class MonthlyPaymentPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;

  const MonthlyPaymentPage({Key? key, required this.dashboardBloc})
      : super(key: key);

  @override
  State<MonthlyPaymentPage> createState() => _MonthlyPaymentPageState();
}

class _MonthlyPaymentPageState extends State<MonthlyPaymentPage>
    with BaseMixin {
  @override
  void initState() {
    widget.dashboardBloc.add(GetMonthlyPaymentEvent());
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
              LocaleKeys.ttl_monthly_payment.tr(),
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          body: state.isLoading!
              ? SizedBox(
                  height: 0.9.sh,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : state.monthlyPaymentModel.listMonthlyPayment != null &&
                      state.monthlyPaymentModel.listMonthlyPayment!.isNotEmpty
                  ? ListView.builder(
                      itemCount:
                          state.monthlyPaymentModel.listMonthlyPayment!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 20.h, left: 3.w, right: 3.w),
                          child: Card(
                            child: Column(
                              children: [
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
                                          '${state.monthlyPaymentModel.listMonthlyPayment![index].dEVNAME}:'
                                              '${state.monthlyPaymentModel.listMonthlyPayment![index].sHORTCODE}',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              color: MyColors.colorBlack,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${state.monthlyPaymentModel.listMonthlyPayment![index].pAYNAME}',
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: MyColors.colorBlack,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Sketch',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.w),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${LocaleKeys.ttl_contract_no.tr()} : ${state.monthlyPaymentModel.listMonthlyPayment![index].iNTCONTRACTNO}',
                                              style: TextStyle(
                                                  fontSize: 12.5.sp,
                                                  color: MyColors.colorBlack,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/due_pay.png',
                                                    width: 20.w),
                                                SizedBox(width: 6.w,),
                                                Text(
                                                  '${LocaleKeys.ttl_due_by.tr()} ${getFormattedDate(
                                                      state.monthlyPaymentModel.listMonthlyPayment![index].dUEDATE!,
                                                    outputFormat: DateFormat.YEAR_ABBR_MONTH_DAY
                                                  )}',
                                                  style: TextStyle(
                                                      fontSize: 12.5.sp,
                                                      color: MyColors
                                                          .colorDimGreen,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 12.h,
                                            ),
                                            Text(
                                              '${state.monthlyPaymentModel.listMonthlyPayment![index].tYPENAME}',
                                              style: TextStyle(
                                                fontSize: 11.5.sp,
                                                color: MyColors.colorBGRed,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/ribbontwo.png',
                                                  height: 40.h,
                                                  fit: BoxFit.fill,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      '${state.monthlyPaymentModel.listMonthlyPayment![index].pAYABLEAMT} ${LocaleKeys.ttl_aed.tr()}',
                                                      style: TextStyle(
                                                        fontSize: 12.5.sp,
                                                        color: MyColors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8.h,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
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
        );
      },
    );
  }
}
