import 'package:cached_network_image/cached_network_image.dart';
import 'package:cityproperties/Constants/AppConstants.dart';
import 'package:cityproperties/CustomColors/MyColors.dart';
import 'package:cityproperties/CustomLists/ListMaintenanceHistory.dart';
import 'package:cityproperties/CustomLists/ListMaterials.dart';
import 'package:cityproperties/Mixins/BaseMixin.dart';
import 'package:cityproperties/Screens/Maintenance/Bloc/maintenance_bloc.dart';
import 'package:cityproperties/Screens/Maintenance/Bloc/maintenance_state.dart';
import 'package:cityproperties/Screens/Maintenance/Model/MaintenanceHistoryModel.dart';
import 'package:cityproperties/Screens/Maintenance/Widgets/ComplaintDetailWidget.dart';

import 'package:cityproperties/Screens/Maintenance/Widgets/TechDetailWidget.dart';
import 'package:cityproperties/Screens/RateTheWork/RateTheWorkPage.dart';
import 'package:cityproperties/WebView/WebViewer.dart';
import 'package:cityproperties/injection.dart';
import 'package:cityproperties/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ComplaintDetailPage extends StatefulWidget {
  final ListMaintenanceHistory listMaintHistory;

  const ComplaintDetailPage({
    Key? key,
    required this.listMaintHistory,
  }) : super(key: key);

  @override
  State<ComplaintDetailPage> createState() => _ComplaintDetailPageState();
}

class _ComplaintDetailPageState extends State<ComplaintDetailPage>
    with BaseMixin {
  MaintenanceBloc bloc = sl<MaintenanceBloc>();

  @override
  void initState() {

      bloc.add(GetJobMaterialEvent(cmdNo: widget.listMaintHistory.cMDNO!,
         status:widget.listMaintHistory.sTATUSNAME!

      ));

    bloc.add(
        GetTechDetailsEvent(assignTo: widget.listMaintHistory.aSSIGNEDTO!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaintenanceBloc, MaintenanceState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.errorJobInfo!.isNotEmpty) {
          showInSnackBar(context, state.errorJobInfo!);
        }
        if (state.jobDetailsModel.listJobDetails != null &&
            state.jobDetailsModel.listJobDetails!.isNotEmpty) {
          if (state.jobDetailsModel.listJobDetails![0].cVID != null &&
              state.jobDetailsModel.listJobDetails![0].cVID!.isNotEmpty) {
            String str =
                "https://rcbm.erems.ae/jobvisit/JobInvoice/${state.jobDetailsModel.listJobDetails![0].cMDNO!}/${state.jobDetailsModel.listJobDetails![0].cVID!}";
           // print(str);
           //  print("str");
           //  print(str);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewer(url: str),
                ));
          } else {
            showAlertDialog(
                context: context,
                title: LocaleKeys.lbl_no_voucher.tr(),
                msg: LocaleKeys.ttl_No_Record_Available.tr(),
                positivePressed: () {
                  Navigator.pop(context);
                });
          }
        }
      },
      child: BlocBuilder<MaintenanceBloc, MaintenanceState>(
        bloc: bloc,
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: state.isLoadingJobInfo!,
              child: Scaffold(
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
                    "${widget.listMaintHistory.dEVNAME??""} ${widget.listMaintHistory.sHORTCODE??""}",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                body: state.isLoadingDetails!
                    ? SizedBox(
                        height: 0.9.sh,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : SafeArea(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(20.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (widget.listMaintHistory.sTATUSNAME ==
                                    'Received') ...[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: CachedNetworkImage(
                                      width: MediaQuery.of(context).size.width,
                                      height: 140.h,
                                      imageUrl: AppConstants.serverUrlImages +
                                          widget.listMaintHistory.kCMDIMAGES!,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(
                                        Icons.image,
                                        size: 140.w,
                                        color: MyColors.colorGrey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 17.h,
                                  ),
                                ],
                                ComplaintDetailWidget(
                                    listMaintHistory: widget.listMaintHistory),
                                SizedBox(
                                  height: 17.h,
                                ),
                                if (state.techData.technician != null &&
                                    state.techData.technician!.isNotEmpty) ...[
                                  TechDetailWidget(
                                    technician: state.techData.technician![0],
                                    statusName: widget.listMaintHistory.sTATUSNAME??"",
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                ],
                                if (widget.listMaintHistory.sTATUSNAME ==
                                    'Completed')
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RateTheWorkPage(
                                                  jobNo: widget
                                                      .listMaintHistory.cMDID!,
                                                ),
                                              ));
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(13.sp)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    MyColors.colorBGBrown)),
                                        child: Text(
                                          LocaleKeys.lbl_rate_the_work.tr(),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),

                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          bloc.add(GetJobDetailsEvent(
                                              jobNo: widget
                                                  .listMaintHistory.cMDID!));
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.all(13.sp)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    MyColors.colorBGBrown)),
                                        child: Text(
                                          LocaleKeys.tt_receipt.tr(),
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                if (state
                                        .jobMaterialDataModel.listJobMaterial !=
                                    null)
                                  Visibility(
                                    visible: state.jobMaterialDataModel
                                        .listJobMaterial!.isNotEmpty,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          LocaleKeys.ttl_materials.tr(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Container(
                                          height: 2.h,
                                          width: 1.sw,
                                          color: MyColors.liteWhite,
                                        ),
                                        ListView.separated(
                                          itemCount: state.jobMaterialDataModel
                                              .listJobMaterial!.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 18.h, horizontal: 10.w),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListMaterials(
                                              listJobMaterialData: state
                                                  .jobMaterialDataModel
                                                  .listJobMaterial![index],
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  Container(
                                            height: 2.h,
                                            width: 1.sw,
                                            color: MyColors.liteWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ));
        },
      ),
    );
  }
}
