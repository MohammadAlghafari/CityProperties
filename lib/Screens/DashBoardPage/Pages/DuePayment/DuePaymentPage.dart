import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
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
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DuePaymentPage extends StatefulWidget {
  final DashboardBloc dashboardBloc;

  const DuePaymentPage({Key? key, required this.dashboardBloc})
      : super(key: key);

  @override
  State<DuePaymentPage> createState() => _DuePaymentPageState();
}

class _DuePaymentPageState extends State<DuePaymentPage> with BaseMixin {
  @override
  void initState() {
    widget.dashboardBloc.add(GetDuePaymentEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: widget.dashboardBloc,
      listener: (context, state) {
        if (state.errorImage!.isNotEmpty) {
          showInSnackBar(
            context,
            state.errorImage!,
          );
        } else if (state.duePaymentImageModel.listDuePaymentImage != null &&
            state.duePaymentImageModel.listDuePaymentImage!.isNotEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GalleryView(
                        imageUrl: AppConstants.serverUrlImages +
                            state.duePaymentImageModel.listDuePaymentImage![0]
                                .cHQIMAGE!,
                      )));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.isLoadingImage!,
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
                  LocaleKeys.ttl_due_payment.tr(),
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              body: state.isLoading!
                  ? SizedBox(
                      height: 0.9.sh,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ))
                  : state.duePaymentModel!.listDuePayment != null &&
                          state.duePaymentModel!.listDuePayment!.isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              state.duePaymentModel!.listDuePayment!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: 20.h, left: 3.w, right: 3.w),
                              child: GestureDetector(
                                onTap: () {
                                  widget.dashboardBloc
                                      .add(GetDuePaymentImageEvent(
                                    contractNo: state.duePaymentModel!
                                        .listDuePayment![index].iNTCONTRACTNO!,
                                    chqueNo: state.duePaymentModel!
                                        .listDuePayment![index].cHEQUENO!,
                                  ));
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/tag_rect.png',
                                            width: 1.sw,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                      'assets/coin.png',
                                                      width: 20.w,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    SizedBox(
                                                      height: 7.h,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 0.8.sw,
                                            child: Text(
                                              '${LocaleKeys.ttl_payment_of.tr()} '
                                              '${state.duePaymentModel!.listDuePayment![index].pAYABLEAMT!} '
                                              '${LocaleKeys.ttl_aed.tr()} '
                                              '${LocaleKeys.ttl_for_unit.tr()} ${state.duePaymentModel!.listDuePayment![index].sHORTCODE!}',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: MyColors.white,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${LocaleKeys.ttl_cheque_no.tr()}:${state.duePaymentModel!.listDuePayment![index].cHEQUENO!} ',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: MyColors.colorBlack),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${LocaleKeys.ttl_contract_no.tr()}:${state.duePaymentModel!.listDuePayment![index].iNTCONTRACTNO!} ',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: MyColors.colorBlack),
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.w),
                                        child: Row(
                                          children: [
                                            if (state
                                                        .duePaymentModel!
                                                        .listDuePayment![index]
                                                        .dUEDATE !=
                                                    null &&
                                                state
                                                        .duePaymentModel!
                                                        .listDuePayment![index]
                                                        .dUEDATE!
                                                        .length >
                                                    8)
                                              Expanded(
                                                child: Text(
                                                  '${LocaleKeys.ttl_due_date.tr()}:'
                                                  // ignore: prefer_interpolation_to_compose_strings
                                                 " ${state.duePaymentModel!.listDuePayment![index].dUEDATE!}",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color:
                                                          MyColors.colorBlack),
                                                ),
                                              ),
                                            Expanded(
                                              child: Text(
                                                '${state.duePaymentModel!.listDuePayment![index].bANKNAME!} ',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: MyColors.colorBlack),
                                                textAlign: TextAlign.end,
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
                        )),
        );
      },
    );
  }
}
